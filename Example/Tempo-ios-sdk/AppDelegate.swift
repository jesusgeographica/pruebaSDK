//
//  AppDelegate.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 13/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var License = "XTUM0Q0ZRQ1JqaHpudExBaXI4MVRoeFYwdDF1bjNsU2xjd0lWQUtWOVlLTWFhRkwwTUYzWVJaNTJ1MzY2TWdtMAoKYXBwVG9rZW49OTQ4NDE5ODctODA5Mi00OTBlLTkwNDQtNzZlZWRkYWI3YmZhCmJ1bmRsZUlkZW50aWZpZXI9Z3MuZ2VvZ3JhcGhpY2EudGVtcG9zZGsKb25saW5lTGljZW5zZT0xCnByb2R1Y3RzPXNkay1pb3MtNC4qCndhdGVybWFyaz1jYXJ0b2RiCg==";
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UINavigationController.init(rootViewController: ViewController())
        window!.makeKeyAndVisible()
        return true
    }
}
