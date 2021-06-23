//
//  Urls.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

public class Urls: NSObject, Codable, NSSecureCoding {
    public static var supportsSecureCoding: Bool {
        return true
    }
    let raw, full, regular, small: String
    let thumb: String
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(raw, forKey: "raw")
        aCoder.encode(full, forKey: "full")
        aCoder.encode(regular, forKey: "regular")
        aCoder.encode(small, forKey: "small")
        aCoder.encode(thumb, forKey: "thumb")
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.raw = aDecoder.decodeObject(forKey: "raw") as! String
        self.full = aDecoder.decodeObject(forKey: "full") as! String
        self.regular = aDecoder.decodeObject(forKey: "regular") as! String
        self.small = aDecoder.decodeObject(forKey: "small") as! String
        self.thumb = aDecoder.decodeObject(forKey: "thumb") as! String
        
    }
}

typealias Welcome = [WelcomeElement]
