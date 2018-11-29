//
//  ECIUser.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 12/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import ObjectMapper

public class ECIUser: Mappable {
    
    public var user_id : Int = 0
    public var user_type : Int = 1
    public var eci_user_id : String = ""
    
    
    public required init?(map: Map) {
        eci_user_id <- map["eci_user_id"]
        user_type <- map["type"]
    }
    
    public init(eci_user_id: String, type: Int){
        self.user_type = type
        self.eci_user_id = eci_user_id
    }
    
    // Mappable
    public func mapping(map: Map) {
        eci_user_id <- map["eci_user_id"]
        user_type <- map["type"]
    }
}
