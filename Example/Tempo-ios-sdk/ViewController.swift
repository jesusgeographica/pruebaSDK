//
//  ViewController.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 15/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import TempoSDK

class ViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initMap(licenceCarto: "XTUM0Q0ZRQ1JqaHpudExBaXI4MVRoeFYwdDF1bjNsU2xjd0lWQUtWOVlLTWFhRkwwTUYzWVJaNTJ1MzY2TWdtMAoKYXBwVG9rZW49OTQ4NDE5ODctODA5Mi00OTBlLTkwNDQtNzZlZWRkYWI3YmZhCmJ1bmRsZUlkZW50aWZpZXI9Z3MuZ2VvZ3JhcGhpY2EudGVtcG9zZGsKb25saW5lTGljZW5zZT0xCnByb2R1Y3RzPXNkay1pb3MtNC4qCndhdGVybWFyaz1jYXJ0b2RiCg==")
        loadMap()
        
        /*
        TempoService.login(user: ECIUser.init(eci_user_id: "123pollitoingles", type: 1), sendSuccessCompletion: { (userData) in
            let user : ECIUser = userData!
            print(user.eci_user_id)
            
        }) { (message) in
            print(message)
        }
        TempoService.verifyToken(sendSuccessCompletion: { (token) in
            
            print(token)
        }) { (message) in
            print(message)
        }
        
        TempoService.listCenters(sendSuccessCompletion: { (centers) in
            print(centers.count)
        }) { (message) in
            print(message)
        }
        
        TempoService.getCenter(center_id: "205", sendSuccessCompletion: { (center) in
            print(center.centre_name)
        }) { (message) in
            print(message)
        }
        TempoService.getCenter(center_id: "205", sendSuccessCompletion: { (center) in
            
            TempoService.getMBTiles(name: center.code ,url: (center.cartography.first?.basemap?.url)!, sendSuccessCompletion: { (files) in
                
                
            }, failureCompletion: { (message) in
                print("error")
            })
            
        }) { (message) in
            print("error")
        }
        
         */
    }
}
