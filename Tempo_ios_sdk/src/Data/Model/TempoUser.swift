//
//  TempoUser.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 12/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import ObjectMapper

public class TempoUser: Mappable {
    
    var user_id : Int = 0
    var user_type : Int = 1
    var eci_user_id : String = ""
    var token : TokenECI?
    
    var detail : String?
    
    public required init?(map: Map) {
        user_id <- map["user_id"]
        user_type <- map["type"]
        eci_user_id <- map["eci_user_id"]
        token <- map["token"]
        detail <- map["detail"]
    }
    
    public init(eci_user_id: String, type: Int){
        self.user_type = type
        self.eci_user_id = eci_user_id
    }
    
    // Mappable
    public func mapping(map: Map) {
        user_id <- map["user_id"]
        user_type <- map["type"]
        eci_user_id <- map["eci_user_id"]
        token <- map["token"]
        detail <- map["detail"]
    }
    
    func getECIUser() -> ECIUser{
        let user = ECIUser.init(eci_user_id: eci_user_id, type: user_type)
        user.user_id = user_id
        return user
    }
}

class TokenECI: Mappable {
    var tempo_token : String = ""
    var exp : Float = 3600
    
    public required init?(map: Map) {
        tempo_token <- map["tempo_token"]
        exp <- map["exp"]
    }
    
    // Mappable
    public func mapping(map: Map) {
        tempo_token <- map["tempo_token"]
        exp <- map["exp"]
    }
}
