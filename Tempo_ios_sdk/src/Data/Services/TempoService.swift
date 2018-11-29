//
//  Service.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 12/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJWT

public class TempoService {

    static let enpointPro = ""
    static let enpointDev = "https://tempo-api.geographica.gs"
    
    static let enpoint = enpointDev
    
    static let loginWS = "/auth/eci_token"
    static let refreshTokenWS = "/auth/tempo_token/refresh"
    static let verifyTokenWS = "/auth/tempo_token/verify"
    static let listCenterWS = "/centers"
    static let getCenterWS = "/centers/"
    
    static var apisecret = ""
    
    public static func login(user: ECIUser, sendSuccessCompletion: TempoConstant.HttpManager.loginSuccessCompletion, failureCompletion:  @escaping TempoConstant.HttpManager.loginFailCompletion) {
        let url =  "\(self.enpoint)\(self.loginWS)"
        
        self.apisecret = Bundle.main.object(forInfoDictionaryKey: "TempoApiSecret") as! String
                // Use your myDict here
        let alg = JWTAlgorithm.hs256(self.apisecret)
        var payload = JWTPayload()
        payload.customFields = ["user_id": EncodableValue(value: user.eci_user_id),
                                "user_type": EncodableValue(value: user.user_type)]
        
        let jwtbearer = JWT.init(payload: payload, algorithm: alg, header: nil)
        let auth = jwtbearer?.rawString ?? ""
        let headers = ["Authorization": "bearer \(auth)"]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseObject { (response: DataResponse<TempoUser>) in
            if let data = response.result.value {
                let userTempo : TempoUser = data
                if(userTempo.detail != nil){
                    failureCompletion(userTempo.detail!)
                }
                UserDefaults.standard.set(userTempo.token?.tempo_token, forKey: TempoConstant.suite.token)
                UserDefaults.standard.set(userTempo.token?.exp, forKey: TempoConstant.suite.exp)
                UserDefaults.standard.synchronize()
                sendSuccessCompletion?(userTempo.getECIUser())
            }else{
                failureCompletion("500")
            }
        }
    }
    
    public static func refreshToken(sendSuccessCompletion: TempoConstant.HttpManager.tokenSuccessCompletion, failureCompletion:  @escaping TempoConstant.HttpManager.tokenFailCompletion) {
        let url =  "\(self.enpoint)\(self.refreshTokenWS)"
        
        let token : String = UserDefaults.standard.string(forKey: TempoConstant.suite.token) ?? ""
        
        let parameters = ["token": "\(token)"]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<TempoToken>) in
            if let data = response.result.value {
                let token : TempoToken = data
                UserDefaults.standard.set(token.token, forKey: TempoConstant.suite.token)
                UserDefaults.standard.synchronize()
                sendSuccessCompletion?(token.token)
            }else{
                failureCompletion("500")
            }
        }
    }
    
    public static func verifyToken(sendSuccessCompletion: TempoConstant.HttpManager.tokenSuccessCompletion, failureCompletion:  @escaping TempoConstant.HttpManager.tokenFailCompletion) {
        let url =  "\(self.enpoint)\(self.verifyTokenWS)"
        
        let token : String = UserDefaults.standard.string(forKey: TempoConstant.suite.token) ?? ""
        
        let parameters = ["token": "\(token)"]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<TempoToken>) in
            if let data = response.result.value {
                let token : TempoToken = data
                UserDefaults.standard.set(token.token, forKey: TempoConstant.suite.token)
                UserDefaults.standard.synchronize()
                sendSuccessCompletion?(token.token)
            }else{
                failureCompletion("500")
            }
        }
    }
    
    public static func listCenters(sendSuccessCompletion: TempoConstant.HttpManager.listCenterSuccessCompletion, failureCompletion:  @escaping TempoConstant.HttpManager.listCenterFailCompletion) {
        let url =  "\(self.enpoint)\(self.listCenterWS)"
        
        let token = UserDefaults.standard.string(forKey: TempoConstant.suite.token) ?? ""
        let headers = ["Authorization": "bearer \(token)"]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseArray { (response: DataResponse<[ECICenterList]>) in
            if let data = response.result.value {
                let centers : [ECICenterList] = data
                sendSuccessCompletion?(centers)
            }else{
                failureCompletion("500")
            }
            
        }
    }
    
    public static func getCenter(center_id: String, sendSuccessCompletion: TempoConstant.HttpManager.centerSuccessCompletion, failureCompletion:  @escaping TempoConstant.HttpManager.centerFailCompletion) {
        let url =  "\(self.enpoint)\(self.getCenterWS)\(center_id)"
        
        let token = UserDefaults.standard.string(forKey: TempoConstant.suite.token) ?? ""
        let headers = ["Authorization": "bearer \(token)"]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseObject { (response: DataResponse<ECICenter>) in
            if let data = response.result.value {
                let center : ECICenter = data
                sendSuccessCompletion?(center)
            }else{
                failureCompletion("500")
            }
        }
    }
    
    public static func getMBTiles(center: ECICenter, sendSuccessCompletion: TempoConstant.HttpManager.centerMBTSuccessCompletion, failureCompletion:  @escaping TempoConstant.HttpManager.centerMBTFailCompletion) {
        
        let result = TempoFileManager.checkUpdate(name: center.code, date: (center.cartography?.basemap?.upload_date)!)
        if result == true {
            TempoFileManager.downloadMultimedia(name: center.code, extensionFile: "zip", date: (center.cartography?.basemap?.upload_date)!, url: (center.cartography?.basemap?.url)!) { (result) in
                print(result)
                if(result != false){
                    let files = TempoFileManager.getFiles(name: center.code, date: (center.cartography?.basemap?.upload_date)!)
                    sendSuccessCompletion!(files)
                }else{
                    failureCompletion("error")
                }
            }
        }else{
            let files = TempoFileManager.getFiles(name: center.code, date: (center.cartography?.basemap?.upload_date)!)
            sendSuccessCompletion!(files)
        }
    }
    
    public static func getMBTilesOffline(center_id: String, sendSuccessCompletion: TempoConstant.HttpManager.centerMBTSuccessCompletion, failureCompletion:  @escaping TempoConstant.HttpManager.centerMBTFailCompletion) {
        let date = TempoFileManager.checkLastUpdate(name: center_id)
        let files = TempoFileManager.getFiles(name: center_id, date: date)
        sendSuccessCompletion!(files)
    }
}

