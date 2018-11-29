//
//  MapVectorEventListener.swift
//  Tempo_ios_sdk
//
//  Created by Jesus Victorio on 27/11/2018.
//

import Foundation
import CartoMobileSDK

class MapVectorEventListener: NTVectorTileEventListener {
    
    var delegate: MapVectorEventListenerDelegate?
    
    override func onVectorTileClicked(_ clickInfo: NTVectorTileClickInfo!) -> Bool {
        let properties = clickInfo.getFeature()?.getProperties()
        self.delegate?.onClickedEvent(event: properties!)
        return true
    }
    
    override func onVectorTileClickedSwigExplicitNTVectorTileEventListener(_ clickInfo: NTVectorTileClickInfo!) -> Bool {
        return true
    }
    
}

protocol MapVectorEventListenerDelegate {
    
    func onClickedEvent(event: NTVariant)
}
