//
//  ViewController.swift
//  Tempo-ios-sdk
//
//  Created by Javier Aragón on 10/02/2018.
//  Copyright (c) 2018 Javier Aragón. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = UIMapView.init(frame: view.bounds)
        view.addSubview(mapView)
        
        let geoJson: [String : Any]  = [
            "type": "FeatureCollection",
            "features": [
                [
                    "type": "Feature",
                    "properties": nil,
                    "geometry": [
                        "type": "Polygon",
                        "coordinates": [
                            [
                                [
                                    -3.6944103240966797,
                                    40.44734712965495
                                ],
                                [
                                    -3.694442510604858,
                                    40.44666945857137
                                ],
                                [
                                    -3.693326711654663,
                                    40.44662047003545
                                ],
                                [
                                    -3.693380355834961,
                                    40.44739611766125
                                ],
                                [
                                    -3.6944103240966797,
                                    40.44734712965495
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
        
        mapView.drawPolygon(geoJson: geoJson)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

