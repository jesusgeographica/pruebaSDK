//
//  ViewController.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 12/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import GLKit
import CartoMobileSDK
import ObjectMapper
import BottomPopup


open class MapViewController: GLKViewController {
    
    private var license = ""
    
    var mapView: NTMapView?
    var marker: NTMarker?
    
    var lat = 40.4470266
    var lng = -3.6941021
    
    var zoom : Float = 18
    
    var center : ECICenter?
    var collectionView : UICollectionView?
    var floorSelected : String = "4"
    var isOpen : Bool = false
    var mbTileTemp : String = ""
    var tempoStyle : TempoStyle?
    
    let selectListener = MapVectorEventListener()
    
    var coreData = CoreDataStack()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        registerFonts()
    }
    
    /**
     * Register fonts and apply them to labels and navigation
     */
    func registerFonts(){
        let frameworkBundle = Bundle(for: FloorView.self)//Bundled.main
        _ = UIFont.registerFont(bundle: frameworkBundle, fontName: "ECIFont-regular", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: frameworkBundle, fontName: "ECIFont-Light", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: frameworkBundle, fontName: "ECIFont-Medium", fontExtension: "ttf")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ECIFont-Medium", size: 16) ?? UIFont.init()]
        UILabel.appearance().font = UIFont(name: "ECIFont-Regular", size: UIFont.systemFontSize)

    }
    
    /**
     * Create an instance of the map class and register it with the license
     */
    
    public func createMap(){
        
        license = Bundle.main.object(forInfoDictionaryKey: "TempoLicenceCarto") as! String
        NTLog.setShowInfo(true)
        NTMapView.registerLicense(license)
        
        mapView = NTMapView()
        view = mapView
        
        let baseLayer = NTCartoOnlineVectorTileLayer(style: NTCartoBaseMapStyle.CARTO_BASEMAP_STYLE_VOYAGER)
        mapView?.getLayers().add(baseLayer)
        
        let projection = mapView?.getOptions().getBaseProjection()
        let tallinn = projection?.fromLat(lat, lng: lng)
        
        mapView?.setFocus(tallinn, durationSeconds: 0)
        mapView?.setZoom(zoom, durationSeconds: 0)
    }
    
    /**
     * Modify the internal properties of the map for the new center
     */
    
    func setProperties(center: ECICenter){
        self.center = center
        self.title = center.centre_name
        self.floorSelected = center.default_floor
        
        self.showFloors(floor: center.floors)
        lng = Double((center.centroid_geojson?.coordinates.first)!)
        lat = Double((center.centroid_geojson?.coordinates.last)!)
        let projection = mapView?.getOptions().getBaseProjection()
        let tallinn = projection?.fromLat(lat, lng: lng)
        
        mapView?.setFocus(tallinn, durationSeconds: 1)
        mapView?.setZoom(zoom, durationSeconds: 1)
        
    }
    
    /**
     *  Paint the map by following the following processes:
     *  1. Ask for an update of the center to download it, in case of not having internet, access the database to get the current one.
     *  2. If the connection is good, update the center data and get the new MBTile.
     *  3. Load the map style.
     */
    
    public func drawCenter(center_id: String){
        
        TempoService.getCenter(center_id: center_id, sendSuccessCompletion: { (center) in
            self.setProperties(center: center)
            if center.code == "0" {
                return
            }
            self.saveCenterOffline(center: center)
            TempoService.getMBTiles(center: center, sendSuccessCompletion: { (files) in
                self.mbTileTemp = (files.filter({ (url) -> Bool in
                    return url.path.contains("mbtiles")
                }).first?.path)!
                let layers = (files.filter({ (url) -> Bool in
                    return url.path.contains("json")
                }).first?.path)!
                do {
                    let content = try String(contentsOfFile:layers, encoding: String.Encoding.utf8)
                    let stylecss = (Mapper<TempoStyle>().map(JSONString: content))
                    self.tempoStyle = stylecss
                    self.loadStyleTempo()
                } catch {
                    // handle error
                    print("Algo ha ocurrido mientras se cargaba el mbtile")
                }
                
            }, failureCompletion: { (message) in
                print("error")
            })
        }) { (message) in
            self.loadOffline(center_id: center_id)
        }
    }
    
    func loadOffline(center_id: String){
        let centerFR = ListService.getCenter(managedObjectContext: coreData.persistentContainer.viewContext, code: center_id)
        if((centerFR.fetchedObjects?.count)! > 0){
            let centerDB = centerFR.fetchedObjects?.first
            center = ECICenter.init(center: centerDB!)
            self.setProperties(center: center!)
            TempoService.getMBTilesOffline(center_id: center_id, sendSuccessCompletion: { (files) in
                self.mbTileTemp = (files.filter({ (url) -> Bool in
                    return url.path.contains("mbtiles")
                }).first?.path)!
                let layers = (files.filter({ (url) -> Bool in
                    return url.path.contains("json")
                }).first?.path)!
                do {
                    let content = try String(contentsOfFile:layers, encoding: String.Encoding.utf8)
                    let stylecss = (Mapper<TempoStyle>().map(JSONString: content))
                    self.tempoStyle = stylecss
                    self.loadStyleTempo()
                } catch {
                    // handle error
                    print("Algo ha ocurrido mientras se cargaba el mbtile")
                }
            }, failureCompletion: { (message) in
                print(message)
            })
        }
    }
    
    /**
     * Show the collectionview for the floors.
     */
    
    public func showFloors(floor: [String]){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 48, height: 48)
        layout.scrollDirection = .vertical
        
        self.collectionView = UICollectionView(frame: CGRect(x: Int(UIScreen.main.bounds.size.width-68), y: 100, width: 48, height: 48), collectionViewLayout: layout)
        self.collectionView?.layer.cornerRadius = 5
        
        let frameworkBundle = Bundle(for: FloorView.self)//Bundled.main
        
        let nib = UINib(nibName: "FloorView", bundle: frameworkBundle)
        let nibHeader = UINib(nibName: "HeaderCollectionFloorView", bundle: frameworkBundle)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: "floorViewIdentifier")
        self.collectionView?.register(nibHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionFloorViewIdentifier")

        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        TempoMap.drawStyleFloors(collectionView: self.collectionView!)
        self.view.addSubview((self.collectionView)!)
    }
    
    func loadStyleTempo(){
        TempoMap.showMBTileonMap(mbtile: self.mbTileTemp, map: self.mapView!, layers: self.tempoStyle!, floor:self.floorSelected)
        
        self.selectListener?.delegate = self as MapVectorEventListenerDelegate
        TempoMap.offlineLayer?.setVectorTileEventListener(self.selectListener)
    }
    
    func showContentEvent(text: String) {
        DispatchQueue.main.async {
            // Access UI stuff here
            let bundleMap = Bundle.init(for: MapContentViewController.self)
            let contentView = MapContentViewController(nibName: "MapContentViewController", bundle: bundleMap)//()
            contentView.height = 200
            contentView.topCornerRadius = 5
            contentView.presentDuration = 0.25
            contentView.dismissDuration = 0.25
            contentView.shouldDismissInteractivelty = true
            contentView.titleLabel = text
            contentView.popupDelegate = self
            self.present(contentView, animated: true, completion: nil)
        }
    }
    
    func saveCenterOffline(center: ECICenter){
        ListService.createCenter(coreDate: coreData, center: center)
    }
}

extension MapViewController : UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var frame = self.collectionView?.frame
        if isOpen == false {
            frame?.size.height = CGFloat(((self.center?.floors.count)! * 48) + 20)
        }else{
            let floorValue = center?.floors[indexPath.item]
            if floorValue != "\(self.floorSelected)" {
                self.floorSelected = floorValue!
                self.collectionView?.reloadData()
                TempoMap.changeFloor(mbtile: self.mbTileTemp, map: self.mapView!, layers: self.tempoStyle!, center: self.center!, floor:self.floorSelected)
                //Cargar planta
                print("Loading floor \(floorValue!)......")
            }
            frame?.size.height = CGFloat(48)
        }
        isOpen = !isOpen
        self.collectionView?.frame = frame!
        collectionView.reloadData()
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionFloorViewIdentifier", for: indexPath)
            
            //do other header related calls or settups
            return reusableview
            
            
        default:  fatalError("Unexpected element kind")
        }
    }
}

extension MapViewController : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isOpen == false {
            return 1
        }else{
            return (self.center?.floors.count)!
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let floor = collectionView.dequeueReusableCell(withReuseIdentifier: "floorViewIdentifier", for: indexPath) as! FloorView
        if isOpen == true {
            let floorValue = center?.floors[indexPath.item]
            if floorValue == self.floorSelected {
                floor.select = true
            }else{
                floor.select = false
            }
            floor.floor = floorValue
            
            floor.setupCellOpen()
        }else{
            floor.select = false
            floor.floor = self.floorSelected
            
            floor.setupCellClose()
        }
        
        
        return floor
    }
}

extension MapViewController : UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 48, height: 48)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if isOpen == true {
            return CGSize(width: collectionView.frame.width, height: 20)
        }else{
            return CGSize(width: collectionView.frame.width, height: 0)
        } //add your height here
    }
}

extension MapViewController : MapVectorEventListenerDelegate {
    func onClickedEvent(event: NTVariant) {
        let type = event.getObjectElement("type")?.getString()
        if type != "PERIMETRO" {
            let nameBet = event.getObjectElement("name")?.getString()
            showContentEvent(text: nameBet!)
            TempoMap.showStyleDetail(mbtile: self.mbTileTemp, map: self.mapView!, layers: self.tempoStyle!, center: self.center!, floor:self.floorSelected, cartodb_id: (event.getObjectElement("cartodb_id")?.description())!)
        }
    }
}

extension MapViewController : BottomPopupDelegate {
    public func bottomPopupViewLoaded() {}
    public func bottomPopupWillAppear() {}
    public func bottomPopupDidAppear() {}
    public func bottomPopupWillDismiss() {}
    public func bottomPopupDidDismiss() {
        TempoMap.hideStyleDetail(mbtile: self.mbTileTemp, map: self.mapView!, layers: self.tempoStyle!, center: self.center!, floor:self.floorSelected)
    }
    public func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {}
}
