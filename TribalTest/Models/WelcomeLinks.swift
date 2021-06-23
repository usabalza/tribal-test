//
//  WelcomeLinks.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

public class WelcomeLinks: NSObject, Codable, NSSecureCoding {
    
    public static var supportsSecureCoding: Bool {
        return true
    }
    let linksSelf, html, download, downloadLocation: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(linksSelf, forKey: "linksSelf")
        aCoder.encode(html, forKey: "html")
        aCoder.encode(download, forKey: "download")
        aCoder.encode(downloadLocation, forKey: "downloadLocation")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.linksSelf = aDecoder.decodeObject(forKey: "linksSelf") as! String
        self.html = aDecoder.decodeObject(forKey: "html") as! String
        self.download = aDecoder.decodeObject(forKey: "download") as! String
        self.downloadLocation = aDecoder.decodeObject(forKey: "downloadLocation") as! String
        
    }
}
