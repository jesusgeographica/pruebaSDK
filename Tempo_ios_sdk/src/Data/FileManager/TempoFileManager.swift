//
//  FileManager.swift
//  EmasesaRutasAguas
//
//  Created by Jesús Victorio Martin on 11/5/18.
//  Copyright © 2018 Jesús Victorio Martin. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SSZipArchive

class TempoFileManager {
    
    static let sharedInstance = TempoFileManager()
    
    let fileManager = FileManager.default

    lazy var zipDirectory: URL = {
        let urls = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        let documentDirectoryURL = urls[urls.count - 1] as URL
        let zipDirectoryURL = documentDirectoryURL.appendingPathComponent("zip")
        
        if fileManager.fileExists(atPath: zipDirectoryURL.path) == false{
            do{
                try fileManager.createDirectory(at: zipDirectoryURL, withIntermediateDirectories: true, attributes: nil)
            }catch{
            }
        }
        return zipDirectoryURL
    }()
    
    lazy var zipDirectoryPath: String = {
        var path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        path += "/zip"
        let url = URL(fileURLWithPath: path)
        
        if fileManager.fileExists(atPath: path) == false{
            do{
                try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            }catch{
            }
        }
        return url.path
    }()
    
    static func downloadFile(name: String, extensionFile: String, data: Data) -> Bool{
        let path = sharedInstance.zipDirectory
        
        let nameComplete = "\(name).\(extensionFile)"
        let pathComplete = path.appendingPathComponent(nameComplete)
        
        let fileExists = FileManager.default.fileExists(atPath: pathComplete.path)
        if fileExists == true {
            print("File exists")
            return false
        } else {
            print("File does not exist, create it")
            FileManager.default.createFile(atPath: pathComplete.path, contents: data, attributes: nil)
            return true
        }
    }
        
    static func downloadMultimedia(name: String, extensionFile: String, date: String, url: String, completionHandler: @escaping (_ accepted: Bool) -> Void) {
        var path = sharedInstance.zipDirectoryPath
        let pathURL = sharedInstance.zipDirectory
        let nameComplete = "\(name).\(extensionFile)"
        let destinationPath = "\(path)/\(name)/\(date)/\(nameComplete)"
        path = "\(path)/\(name)/\(date)"
        //OPCION 1
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let pathComplete = pathURL.appendingPathComponent("\(name)/\(date)/\(nameComplete)")
            if TempoFileManager.sharedInstance.fileManager.fileExists(atPath: pathComplete.path) == false{
                do{
                    try TempoFileManager.sharedInstance.fileManager.createDirectory(at: pathComplete, withIntermediateDirectories: true, attributes: nil)
                }catch{
                }
            }
            return (pathComplete, [.removePreviousFile])
        }
        //OPCION 2
        Alamofire.download(
            url,
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: nil,
            to: destination).downloadProgress(closure: { (progress) in
                print("PROGRES: \(progress.fractionCompleted)%")
            }).response(completionHandler: { (DefaultDownloadResponse) in
                if(DefaultDownloadResponse.error != nil){
                    completionHandler(false)
                }else{
                    let success: Bool = SSZipArchive.unzipFile(atPath: destinationPath,
                                                               toDestination: path,
                                                               preserveAttributes: true,
                                                               overwrite: true,
                                                               nestedZipLevel: 1,
                                                               password: nil,
                                                               error: nil,
                                                               delegate: nil,
                                                               progressHandler: nil,
                                                               completionHandler: nil)
                    
                    if success != false {
                        print("Success unzip")
                        let result = TempoFileManager.deleteFile(name: name, extensionFile: extensionFile, date: date)
                        if result != false {
                            completionHandler(true)
                        }else{
                            completionHandler(false)
                        }
                    } else {
                        completionHandler(false)
                    }
                }
            }
        )
    }
 
    static func deleteFile(name: String, extensionFile: String, date: String) -> Bool{
        let path = sharedInstance.zipDirectory
        
        let nameComplete = "\(name)/\(date)/\(name).\(extensionFile)"
        let pathComplete = path.appendingPathComponent(nameComplete)
        
        let fileExists = FileManager.default.fileExists(atPath: pathComplete.path)
        if fileExists == true {
            do{
                try FileManager.default.removeItem(atPath: pathComplete.path)
            }catch{
                return false
            }
            print("File exists")
            return true
        } else {
            print("File does not exist")
            return false
        }
    }
    
    private static func deleteFolder(name: String, date: String) -> Bool{
        let path = sharedInstance.zipDirectory
        
        let nameComplete = "\(name)/\(date)"
        let pathComplete = path.appendingPathComponent(nameComplete)
        
        let fileExists = FileManager.default.fileExists(atPath: pathComplete.path)
        if fileExists == true {
            do{
                try FileManager.default.removeItem(atPath: pathComplete.path)
            }catch{
                return false
            }
            print("File exists")
            return true
        } else {
            print("File does not exist")
            return false
        }
    }
    
    static func checkUpdate(name: String, date: String) -> Bool{
        let path = sharedInstance.zipDirectory
        
        let nameComplete = "\(name)"
        //let pathComplete = path.appendingPathComponent(nameComplete)
        let pathComplete2 = path.appendingPathComponent(nameComplete)
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: pathComplete2, includingPropertiesForKeys: nil)
            
            let dateFormat = DateFormatter.init()
            dateFormat.dateFormat = TempoConstant.format.date
            let date1 = dateFormat.date(from: date)
            for file in fileURLs {
                let dateString = file.path.components(separatedBy: "/").last
                let datefile = dateFormat.date(from: dateString!)
                if(datefile != nil) {
                    if(date1! > datefile!){
                        _ = self.deleteFolder(name: name, date: dateString!)
                    }else{
                        return false
                    }
                }
            }
            return true
            // process files
        } catch {
            print("Error while enumerating files \(pathComplete2.path): \(error.localizedDescription)")
            return true
        }
    }
    
    static func checkLastUpdate(name: String) -> String{
        let path = sharedInstance.zipDirectory
        
        let nameComplete = "\(name)"
        //let pathComplete = path.appendingPathComponent(nameComplete)
        let pathComplete2 = path.appendingPathComponent(nameComplete)
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: pathComplete2, includingPropertiesForKeys: nil)
            
            let dateFormat = DateFormatter.init()
            dateFormat.dateFormat = TempoConstant.format.date
            for file in fileURLs {
                let dateString = file.path.components(separatedBy: "/").last
                let datefile = dateFormat.date(from: dateString!)
                if(datefile != nil) {
                    return dateString!
                }
            }
            return ""
            // process files
        } catch {
            print("Error while enumerating files \(pathComplete2.path): \(error.localizedDescription)")
            return ""
        }
    }
    
    static func getFiles(name: String, date: String) -> [URL]{
        let path = sharedInstance.zipDirectory
        
        let nameComplete = "\(name)/\(date)"
        //let pathComplete = path.appendingPathComponent(nameComplete)
        let pathComplete2 = path.appendingPathComponent(nameComplete)
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: pathComplete2, includingPropertiesForKeys: nil)
            return fileURLs
            // process files
        } catch {
            print("Error while enumerating files \(pathComplete2.path): \(error.localizedDescription)")
            return []
        }
    }
}
