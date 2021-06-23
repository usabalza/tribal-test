//
//  UserLinks.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

public class UserLinks: NSObject, Codable, NSSecureCoding {
    public static var supportsSecureCoding: Bool {
        return true
    }
    let linksSelf, html, photos, likes: String
    let portfolio, following, followers: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(linksSelf, forKey: "linksSelf")
        aCoder.encode(html, forKey: "html")
        aCoder.encode(photos, forKey: "photos")
        aCoder.encode(likes, forKey: "likes")
        aCoder.encode(portfolio, forKey: "portfolio")
        aCoder.encode(following, forKey: "following")
        aCoder.encode(followers, forKey: "followers")
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.linksSelf = aDecoder.decodeObject(forKey: "linksSelf") as! String
        self.html = aDecoder.decodeObject(forKey: "html") as! String
        self.photos = aDecoder.decodeObject(forKey: "photos") as! String
        self.likes = aDecoder.decodeObject(forKey: "likes") as! String
        self.portfolio = aDecoder.decodeObject(forKey: "portfolio") as! String
        self.following = aDecoder.decodeObject(forKey: "following") as! String
        self.followers = aDecoder.decodeObject(forKey: "followers") as! String
        
    }
    
}
