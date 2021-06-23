//
//  ProfileImage.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

public class ProfileImage: NSObject, Codable, NSSecureCoding {
    public static var supportsSecureCoding: Bool {
        return true
    }
    let small, medium, large: String
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(small, forKey: "small")
        aCoder.encode(medium, forKey: "medium")
        aCoder.encode(large, forKey: "large")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.small = aDecoder.decodeObject(forKey: "small") as! String
        self.medium = aDecoder.decodeObject(forKey: "medium") as! String
        self.large = aDecoder.decodeObject(forKey: "large") as! String
    }
}
