//
//  TempoToken.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 16/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import ObjectMapper

class TempoToken : Mappable {

    var token : String = ""
    
    public required init?(map: Map) {
        token <- map["token"]
    }
    
    // Mappable
    public func mapping(map: Map) {
        token <- map["token"]
    }
}
