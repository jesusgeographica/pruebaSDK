//
//  TempoConstant.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 16/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit

public struct TempoConstant {
    
    public struct HttpManager {
        public typealias loginFailCompletion = (_ message: String) -> Void
        public typealias loginSuccessCompletion = ((_ user: ECIUser?) -> Void)?
        
        public typealias tokenFailCompletion = (_ message: String) -> Void
        public typealias tokenSuccessCompletion = ((_ user: String) -> Void)?
        
        public typealias listCenterFailCompletion = (_ message: String) -> Void
        public typealias listCenterSuccessCompletion = ((_ centers: [ECICenterList]) -> Void)?
        
        public typealias centerFailCompletion = (_ message: String) -> Void
        public typealias centerSuccessCompletion = ((_ center: ECICenter) -> Void)?
        
        public typealias centerMBTFailCompletion = (_ message: String) -> Void
        public typealias centerMBTSuccessCompletion = ((_ center: [URL]) -> Void)?
    }
    
    struct format {
        static let date = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
    
    struct suite {
        static let token = "TempoToken"
        static let exp = "TempoExpires"
    }
    
    struct color {
        struct cell {
            public static let grayBackground = UIColor.init(hexString: "#F0F0F0")
            public static let graySeparator = UIColor.init(hexString: "#E1E1E1")
            public static let greenECI = UIColor.init(hexString: "#008C2E")
            public static let bluePoint = UIColor.init(hexString: "#057BFF")
        }
    }
}
