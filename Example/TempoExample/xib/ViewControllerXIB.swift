//
//  ViewControllerXIB.swift
//  TempoExample
//
//  Created by Jesus Victorio on 20/11/2018.
//  Copyright © 2018 Javier Aragón Encina. All rights reserved.
//

import UIKit
import Tempo_ios_sdk
import SideMenu

class ViewControllerXIB: MapViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMenu()
        addMenuButton()
        self.title = "El Corte Inglés"
        // Do any additional setup after loading the view.
        self.createMap()
        servicesTest()
    }
    
    func addMenuButton(){
        let button1 = UIBarButtonItem(image: UIImage(named: "menuButton"), style: .plain, target: self, action: #selector(menuAction))
        self.navigationItem.leftBarButtonItem  = button1
    }
    
    @objc func menuAction(){
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    func initMenu(){
        let menuController = MenuViewController()
        menuController.centerUpdateDelegate = self as CenterUpdateDelegate
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: menuController)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        SideMenuManager.default.menuDismissOnPush = true
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuPresentMode = .menuSlideIn
    }
    
    func servicesTest(){
        let userECI = ECIUser(eci_user_id: "testECIiOS", type: 1)
        
        TempoService.login(user: userECI, sendSuccessCompletion: { (userData) in
            print(userData!.eci_user_id)
        }) { (message) in
            print(message)
        }
        
        
        /*
         
         TempoService.listCenters(sendSuccessCompletion: { (centers) in
            //self.showListCenter(list: centers)
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
        }*/
    }
}

extension ViewControllerXIB: CenterUpdateDelegate {
    func centerUpdate(didUpdateCenter center_id: String) {
        drawCenter(center_id: center_id)
    }
}
