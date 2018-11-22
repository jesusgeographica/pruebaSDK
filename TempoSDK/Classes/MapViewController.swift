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

open class MapViewController: GLKViewController {
    
    private var license = ""
    
    var mapView: NTMapView?
    var marker: NTMarker?
    
    var lat = 40.4470266
    var lng = -3.6941021
    
    var zoom : Float = 15
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    public func loadMap(){
        mapView = NTMapView()
        view = mapView

        let baseLayer = NTCartoOnlineVectorTileLayer(style: NTCartoBaseMapStyle.CARTO_BASEMAP_STYLE_VOYAGER)
        mapView?.getLayers().add(baseLayer)

        let projection = mapView?.getOptions().getBaseProjection()
        let tallinn = projection?.fromLat(lat, lng: lng)

        mapView?.setFocus(tallinn, durationSeconds: 0)
        mapView?.setZoom(zoom, durationSeconds: 0)
    }
    
    public func initMap(licenceCarto: String){
        license = licenceCarto
        NTLog.setShowInfo(true)
        NTMapView.registerLicense(license)
    }
}
