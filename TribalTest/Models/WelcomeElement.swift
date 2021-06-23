//
//  WelcomeElement.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import CoreData

public class WelcomeElement: NSObject, Codable, NSSecureCoding, ModelCoreData {
    public static var supportsSecureCoding: Bool {
        return true
    }
    var stateCore: StateCore?
    //let trueId: Int?
    let id: String
    let createdAt, updatedAt: String
    let promotedAt: String?
    let width, height: Int
    let color, blurHash: String
    let welcomeDescription, altDescription: String?
    let urls: Urls
    let links: WelcomeLinks
    var categories: [JSONAny]?
    let likes: Int
    let likedByUser: Bool
    var currentUserCollections: [JSONAny]?
    let sponsorship: Sponsorship?
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case welcomeDescription = "description"
        case altDescription = "alt_description"
        case urls, links, categories, likes
        case likedByUser = "liked_by_user"
        case currentUserCollections = "current_user_collections"
        case sponsorship, user
    }
    
    static func getEntity() -> String {
        return Entitys.image.rawValue
        
    }
    
    func getCoreDataDictionary() -> [String : Any?] {
        return [
            "id": self.id,
            "createdAt": self.createdAt,
            "updatedAt": self.updatedAt,
            "promotedAt": self.promotedAt,
            "width": self.width,
            "height": self.height,
            "color": self.color,
            "blurHash": self.blurHash,
            "welcomeDescription": self.welcomeDescription,
            "altDescription": self.altDescription,
            "urls": self.urls,
            "links": self.links,
            "likes": self.likes,
            "likedByUser": self.likedByUser,
            "sponsorship": self.sponsorship,
            "user": self.user
            
        ]
    }
    
    func getIdentifier() -> Int {
        return 1
    }
    
    required init(object: NSManagedObject) {
        self.id = object.value(forKey: "id") as! String
        self.createdAt = object.value(forKey: "createdAt") as! String
        self.updatedAt = object.value(forKey: "updatedAt") as! String
        self.promotedAt = object.value(forKey: "promotedAt") as? String
        self.width = object.value(forKey: "width") as! Int
        self.height = object.value(forKey: "height") as! Int
        self.color = object.value(forKey: "color") as! String
        self.blurHash = object.value(forKey: "blurHash") as! String
        self.welcomeDescription = object.value(forKey: "welcomeDescription") as? String
        self.altDescription = object.value(forKey: "altDescription") as? String
        self.urls = object.value(forKey: "urls") as! Urls
        self.links = object.value(forKey: "links") as! WelcomeLinks
        self.likes = object.value(forKey: "likes") as! Int
        self.likedByUser = object.value(forKey: "likedByUser") as! Bool
        self.sponsorship = object.value(forKey: "sponsorship") as? Sponsorship
        self.user = object.value(forKey: "user") as! User
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(createdAt, forKey: "createdAt")
        aCoder.encode(updatedAt, forKey: "updatedAt")
        aCoder.encode(promotedAt, forKey: "promotedAt")
        aCoder.encode(width, forKey: "width")
        aCoder.encode(height, forKey: "height")
        aCoder.encode(color, forKey: "color")
        aCoder.encode(blurHash, forKey: "blurHash")
        aCoder.encode(welcomeDescription, forKey: "welcomeDescription")
        aCoder.encode(altDescription, forKey: "altDescription")
        aCoder.encode(urls, forKey: "urls")
        aCoder.encode(links, forKey: "links")
        aCoder.encode(likes, forKey: "likes")
        aCoder.encode(likedByUser, forKey: "likedByUser")
        aCoder.encode(sponsorship, forKey: "sponsorship")
        aCoder.encode(user, forKey: "user")
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as! String
        self.createdAt = aDecoder.decodeObject(forKey: "createdAt") as! String
        self.updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as! String
        self.promotedAt = aDecoder.decodeObject(forKey: "promotedAt") as? String
        self.width = aDecoder.decodeInteger(forKey: "width")
        self.height = aDecoder.decodeInteger(forKey: "height")
        self.color = aDecoder.decodeObject(forKey: "color") as! String
        self.blurHash = aDecoder.decodeObject(forKey: "blurHash") as! String
        self.welcomeDescription = aDecoder.decodeObject(forKey: "welcomeDescription") as? String
        self.altDescription = aDecoder.decodeObject(forKey: "altDescription") as? String
        self.urls = aDecoder.decodeObject(forKey: "urls") as! Urls
        self.links = aDecoder.decodeObject(forKey: "links") as! WelcomeLinks
        self.likes = aDecoder.decodeInteger(forKey: "likes")
        self.likedByUser = aDecoder.decodeBool(forKey: "likedByUser")
        self.sponsorship = aDecoder.decodeObject(forKey: "sponsorship") as? Sponsorship
        self.user = aDecoder.decodeObject(forKey: "user") as! User
        
    }
}
