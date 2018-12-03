//
//  Extensions.swift
//  Tempo-ios-sdk
//
//  Created by Jesus Victorio on 16/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import CartoMobileSDK
import CoreData

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
    
    func toNTColor() -> NTColor {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        
        getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        return NTColor(r: UInt8(fRed * 255.0), g: UInt8(fGreen * 255.0), b: UInt8(fBlue * 255.0), a: UInt8(fAlpha * 255.0))
    }
}

public extension NSManagedObject {
    
    convenience init(context: NSManagedObjectContext) {
        let name = String(describing: type(of: self))
        let entity = NSEntityDescription.entity(forEntityName: name, in: context)!
        self.init(entity: entity, insertInto: context)
    }
    
}

extension NSPersistentContainer {
    
    public convenience init(name: String, bundle: Bundle) {
        guard let modelURL = bundle.url(forResource: name, withExtension: "momd"),
            let mom = NSManagedObjectModel(contentsOf: modelURL)
            else {
                fatalError("Unable to located Core Data model")
        }
        
        self.init(name: name, managedObjectModel: mom)
    }
}

extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }
        
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            print("Error registering font: maybe it was already registered.")
            return false
        }
        
        return true
    }
}
