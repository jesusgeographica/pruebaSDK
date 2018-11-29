//
//  ECICenter.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 19/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import ObjectMapper

public class ECICenter : Mappable {
    public var centre_name : String = ""
    public var code : String = ""
    var codeInt : Int = 0
    public var indoor : Bool = false
    public var default_floor : String = "1"
    public var centroid_geojson : ECILocationCenter?
    public var floors : [String] = []
    public var cartography : ECICartographyCenter?
    
    public required init?(map: Map) {
        centre_name <- map["centre_name"]
        codeInt <- map["id"]
        code = "\(codeInt)"
        indoor <- map["indoor"]
        centroid_geojson <- map["centroid_geojson"]
        floors <- map["floors"]
        default_floor <- map["default_floor"]
        cartography <- map["cartography"]
    }
    
    // Mappable
    public func mapping(map: Map) {
        centre_name <- map["centre_name"]
        codeInt <- map["id"]
        code = "\(codeInt)"
        indoor <- map["indoor"]
        centroid_geojson <- map["centroid_geojson"]
        floors <- map["floors"]
        default_floor <- map["default_floor"]
        cartography <- map["cartography"]
    }
}

public class ECILocationCenter : Mappable {
    public var type : String = ""
    public var coordinates : [Float] = []
    public required init?(map: Map) {
        type <- map["type"]
        coordinates <- map["coordinates"]
    }
    
    // Mappable
    public func mapping(map: Map) {
        type <- map["type"]
        coordinates <- map["coordinates"]
    }
}

public class ECICartographyCenter: Mappable {
    public var basemap : ECIDataCenter?
    public var navigation : ECIDataCenter?
    
    public required init?(map: Map) {
        basemap <- map["basemap"]
        navigation <- map["navigation"]
    }
    
    // Mappable
    public func mapping(map: Map) {
        basemap <- map["basemap"]
        navigation <- map["navigation"]
    }
}

public class ECIDataCenter: Mappable {
    public var url : String = ""
    public var upload_date : String = ""
    
    public required init?(map: Map) {
        url <- map["url"]
        upload_date <- map["upload_date"]
    }
    
    // Mappable
    public func mapping(map: Map) {
        url <- map["url"]
        upload_date <- map["upload_date"]
    }
}
