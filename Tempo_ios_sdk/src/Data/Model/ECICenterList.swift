//
//  ECICenterList.swift
//  Tempo_ios_sdk
//
//  Created by Jesus Victorio on 26/11/2018.
//

import UIKit
import ObjectMapper

public class ECICenterList: Mappable {
    public var centre_name : String = ""
    public var code : String = ""
    public var indoor : Bool = false
    public var centroid_geojson : ECILocationCenter?
    
    public required init?(map: Map) {
        centre_name <- map["centre_name"]
        code <- map["id"]
        indoor <- map["indoor"]
        centroid_geojson <- map["centroid_geojson"]
    }
    
    // Mappable
    public func mapping(map: Map) {
        centre_name <- map["centre_name"]
        code <- map["id"]
        indoor <- map["indoor"]
        centroid_geojson <- map["centroid_geojson"]
    }
}
