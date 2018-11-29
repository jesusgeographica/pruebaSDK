//
//  TempoStyle.swift
//  Tempo_ios_sdk
//
//  Created by Jesus Victorio on 23/11/2018.
//

import UIKit
import ObjectMapper

public class TempoStyle: Mappable {
    public var element : String = ""
    public var area : String = ""
    public var element_label : String = ""
    
    public required init?(map: Map) {
        element <- map["element"]
        element_label <- map["element_label"]
        area <- map["area"]
    }
    
    // Mappable
    public func mapping(map: Map) {
        element <- map["element"]
        element_label <- map["element_label"]
        area <- map["area"]
    }
}
