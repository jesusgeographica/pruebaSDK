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
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UINavigationController.init(rootViewController: ViewController())
        window!.makeKeyAndVisible()
        return true
    }
}
