//
//  ViewController.swift
//  Tempo-ios-example
//
//  Created by Jesus Victorio on 12/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import GLKit
import Alamofire

open class MapViewController: GLKViewController {
    
    private let License = "XTUM0Q0ZRQ1JqaHpudExBaXI4MVRoeFYwdDF1bjNsU2xjd0lWQUtWOVlLTWFhRkwwTUYzWVJaNTJ1MzY2TWdtMAoKYXBwVG9rZW49OTQ4NDE5ODctODA5Mi00OTBlLTkwNDQtNzZlZWRkYWI3YmZhCmJ1bmRsZUlkZW50aWZpZXI9Z3MuZ2VvZ3JhcGhpY2EudGVtcG9zZGsKb25saW5lTGljZW5zZT0xCnByb2R1Y3RzPXNkay1pb3MtNC4qCndhdGVybWFyaz1jYXJ0b2RiCg==";
    
    //var mapView: NTMapView?
    //var marker: NTMarker?
    
    var lat = 40.4470266
    var lng = -3.6941021
    
    var zoom : Float = 15
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    public func loadMap(){
    }
    
    public func initMap(){
    }
}
    /*
    func loadMap(){
        mapView = NTMapView()
        view = mapView
        
        let baseLayer = NTCartoOnlineVectorTileLayer(style: NTCartoBaseMapStyle.CARTO_BASEMAP_STYLE_VOYAGER)
        mapView?.getLayers().add(baseLayer)
        
        let projection = mapView?.getOptions().getBaseProjection()
        let tallinn = projection?.fromLat(lat, lng: lng)
        
        mapView?.setFocus(tallinn, durationSeconds: 0)
        mapView?.setZoom(zoom, durationSeconds: 0)
    }
    
    func initMap(){
        NTLog.setShowInfo(true)
        NTMapView.registerLicense(License)
    }
}*/
