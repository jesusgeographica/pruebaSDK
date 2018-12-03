//
//  FileManager.swift
//  EmasesaRutasAguas
//
//  Created by Jesús Victorio Martin on 11/5/18.
//  Copyright © 2018 Jesús Victorio Martin. All rights reserved.
//

import UIKit
import Foundation
import CartoMobileSDK

public class TempoMap {
    static var offlineLayer : NTVectorTileLayer?
    static var decoderCss : NTCartoCSSStyleSet?
    static var css : String = ""
    
    public static func showMBTileonMap(mbtile: String, map: NTMapView, layers: TempoStyle, floor: String){
        if(offlineLayer != nil) {
            map.getLayers()?.remove(offlineLayer)
        }
        let tileDataSource = NTMBTilesTileDataSource(path: mbtile)
        css = generateStylePolygon(floor: floor, layerPolygon: layers.element) + generateStyleTexts(floor: floor, layerLabel: layers.element_label)
        decoderCss = loadStyle(style: css, floor: floor, layerPolygon: layers.element, layerLabel: layers.element_label)
        let tileDecoder = NTMBVectorTileDecoder.init(cartoCSSStyleSet: decoderCss)
        self.offlineLayer = NTVectorTileLayer(dataSource: tileDataSource, decoder: tileDecoder)
        offlineLayer?.getTileDecoder()?.notifyChanged()
        map.getLayers().add(offlineLayer)
    }
    
    public static func changeFloor(mbtile: String, map: NTMapView, layers: TempoStyle, center: ECICenter, floor: String){
        if(offlineLayer != nil) {
            let decoder = offlineLayer?.getTileDecoder() as! NTMBVectorTileDecoder
            css = generateStylePolygon(floor: floor, layerPolygon: layers.element) +
                generateStyleTexts(floor: floor, layerLabel: layers.element_label)
            decoderCss = loadStyle(style: css, floor: floor, layerPolygon: layers.element, layerLabel: layers.element_label)
            decoder.setCartoCSSStyleSet(decoderCss)
            decoder.notifyChanged()
        }
    }
    
    public static func showStyleDetail(mbtile: String, map: NTMapView, layers: TempoStyle, center: ECICenter, floor: String, cartodb_id: String){//737
        if(offlineLayer != nil) {
            let decoder = offlineLayer?.getTileDecoder() as! NTMBVectorTileDecoder
            css = generateStylePolygon(floor: floor, layerPolygon: layers.element) +
                generateStylePolygonSelect(floor: floor, layerPolygon: layers.element, cartodb_in: cartodb_id) +
                generateStyleTexts(floor: floor, layerLabel: layers.element_label)
            decoderCss = loadStyle(style: css, floor: floor, layerPolygon: layers.element, layerLabel: layers.element_label)
            decoder.setCartoCSSStyleSet(decoderCss)
            decoder.notifyChanged()
        }
    }
    
    public static func hideStyleDetail(mbtile: String, map: NTMapView, layers: TempoStyle, center: ECICenter, floor: String){//737
        if(offlineLayer != nil) {
            let decoder = offlineLayer?.getTileDecoder() as! NTMBVectorTileDecoder
            css = generateStylePolygon(floor: floor, layerPolygon: layers.element) +
                generateStyleTexts(floor: floor, layerLabel: layers.element_label)
            decoderCss = loadStyle(style: css, floor: floor, layerPolygon: layers.element, layerLabel: layers.element_label)
            decoder.setCartoCSSStyleSet(decoderCss)
            decoder.notifyChanged()
        }
    }
    
    static func generateStylePolygon(floor: String, layerPolygon: String) -> String{
        let cartoCSS = "#\(layerPolygon) [type='ASEOS'][height=\(floor)]{" +
            "  polygon-fill: #ffffff;" +
            "  polygon-opacity: 1;" +
            "}" +
            "#\(layerPolygon)::outline [type='ASEOS'][height=\(floor)]{" +
            "  line-width: 2;" +
            "  line-color: #a3bee1;" +
            "  line-opacity: 1;" +
            "}" +
            "" +
            "#\(layerPolygon) [type='ASCENSORES'][height=\(floor)]{" +
            "  polygon-fill: #8b7e6a;" +
            "  polygon-opacity: 0.8;" +
            "}" +
            "" +
            "#\(layerPolygon) [type='PERIMETRO'][height=\(floor)]{" +
            "  polygon-fill: #d2c5af;" +
            "  polygon-opacity: 1;" +
            "}" +
            "#\(layerPolygon)::outline [type='PERIMETRO'][height=\(floor)]{" +
            "  line-width: 2;" +
            "  line-color: #cabca4;" +
            "  line-opacity: 1;" +
            "}" +
            "" +
            "#\(layerPolygon) [type='ESCALERAS'][height=\(floor)]{" +
            "  polygon-fill: #8b7e6a;" +
            "  polygon-opacity: 0.8;" +
            "}" +
            "" +
            "#\(layerPolygon) [type='PROBADORES'][height=\(floor)]{" +
            "  polygon-fill: #ffffff;" +
            "  polygon-opacity: 1;" +
            "}" +
            "#\(layerPolygon)::outline [type='PROBADORES'][height=\(floor)]{" +
            "  line-width: 1;" +
            "  line-color: #b19d7c;" +
            "  line-opacity: 1;" +
            "}" +
            "#\(layerPolygon)::outline [type='CORNERS'][height=\(floor)]{" +
            "  line-width: 1;" +
            "  line-color: #e1cbac;" +
            "  line-opacity: 1;" +
            "}" +
            "#\(layerPolygon) [type='CORNERS'][height=\(floor)]{" +
            "  polygon-fill: #f6efe4;" +
            "  polygon-opacity: 1;" +
        "}"
        return cartoCSS
    }
    
    static func generateStylePolygonSelect(floor: String, layerPolygon: String,  cartodb_in: String) -> String{
        let cartoCSS = "#\(layerPolygon) [type='CORNERS'] [cartodb_id=\(cartodb_in)] [height=\(floor)]{" +
            "polygon-fill: #dbf0db;" +
            "polygon-opacity: 1;" +
            "}" +
            "#\(layerPolygon)::outline [type='CORNERS'][cartodb_id=\(cartodb_in)][height=\(floor)]{" +
            "line-width: 2;" +
            "line-color: #88CC88;" +
            "line-opacity: 1;" +
        "}"
        return cartoCSS
    }
    
    static func generateStyleTexts(floor: String, layerLabel: String) -> String{
        let cartoCSS =
            "#\(layerLabel)::labels [type='CORNERS'] [height=\(floor)] {" +
                "text-name: '[name]';" +
                "text-face-name: 'ECIFont Regular';" +
                "text-character-spacing: 1;" +
                "text-size: 11;" +
                "text-fill: #484848;" +
                "text-halo-radius: 1.1;" +
                "text-allow-overlap: false;" +
                "text-min-distance: 4;" +
                "text-dx: 5;" +
                "text-horizontal-alignment: right;" +
            "}" +
            
            "#\(layerLabel) [type='CORNERS'] [height=\(floor)] {" +
                "marker-width: 6;" +
                "marker-fill: #8b7e6a;" +
                "marker-fill-opacity: 1;" +
                "marker-allow-overlap: false;" +
                "marker-line-width: 1.25;" +
                "marker-line-color: #ffffff;" +
                "marker-line-opacity: 0.8;" +
                "marker-allow-overlap: false;" +
            "}" +
            
            "#\(layerLabel) [height=\(floor)] {" +
                "marker-width: 24;" +
                "marker-fill-opacity: 1;" +
                "marker-allow-overlap: false;" +
                "[type='PERIMETRO']{" +
                "marker-width: 0;" +
            "}" +
            "[type='ASEOS']{" +
                "marker-file:url('fonts/aseos.png');" +
            "}" +
            "[type='ASCENSORES']{" +
                "marker-file:url('fonts/ascensor.png');" +
            "}" +
            "[type='PROBADORES']{" +
                "marker-width: 18;" +
                "marker-file:url('fonts/probadores.png');" +
            "}" +
            "[type='ESCALERAS']{" +
                "marker-file:url('fonts/escalera.png');" +
            "}" +
        "}"
        
        return cartoCSS
    }
    
    public static func loadStyle(style: String, floor: String, layerPolygon: String, layerLabel: String) -> NTCartoCSSStyleSet{
        
        let styleAssets = NTAssetUtils.loadAsset("fonts.zip")//"Frameworks/Tempo_ios_sdk.framework/fonts.zip")//
        let assetPackage = NTZippedAssetPackage.init(zip: styleAssets)
        let decodercss = NTCartoCSSStyleSet.init(cartoCSS: style, assetPackage: assetPackage)
        return decodercss ?? NTCartoCSSStyleSet.init()
    }
    
    public static func drawStyleFloors(collectionView: UICollectionView){
        
        collectionView.layer.cornerRadius = 8
        collectionView.backgroundColor = UIColor.white
        collectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        collectionView.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.24).cgColor
        collectionView.layer.shadowOpacity = 1
        collectionView.layer.shadowRadius = 8
    }
}
