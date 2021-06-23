//
//  User.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

public class User: NSObject, Codable, NSSecureCoding{
    public static var supportsSecureCoding: Bool {
        return true
    }
    let id: String
    let updatedAt: String
    let username, name, firstName: String
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio: String?
    let location: String?
    let links: UserLinks
    let profileImage: ProfileImage
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos, forHire: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(updatedAt, forKey: "updatedAt")
        aCoder.encode(username, forKey: "username")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(twitterUsername, forKey: "twitterUsername")
        aCoder.encode(portfolioURL, forKey: "portfolioURL")
        aCoder.encode(bio, forKey: "bio")
        aCoder.encode(location, forKey: "location")
        aCoder.encode(links, forKey: "links")
        aCoder.encode(profileImage, forKey: "profileImage")
        aCoder.encode(instagramUsername, forKey: "instagramUsername")
        aCoder.encode(totalCollections, forKey: "totalCollections")
        aCoder.encode(totalLikes, forKey: "totalLikes")
        aCoder.encode(totalPhotos, forKey: "totalPhotos")
        aCoder.encode(acceptedTos, forKey: "acceptedTos")
        aCoder.encode(forHire, forKey: "forHire")



        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as! String
        self.updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as! String
        self.username = aDecoder.decodeObject(forKey: "username") as! String
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "lastName") as? String
        self.twitterUsername = aDecoder.decodeObject(forKey: "twitterUsername") as? String
        self.portfolioURL = aDecoder.decodeObject(forKey: "portfolioURL") as? String
        self.bio = aDecoder.decodeObject(forKey: "bio") as? String
        self.location = aDecoder.decodeObject(forKey: "location") as? String
        self.links = aDecoder.decodeObject(forKey: "links") as! UserLinks
        self.profileImage = aDecoder.decodeObject(forKey: "profileImage") as! ProfileImage
        self.instagramUsername = aDecoder.decodeObject(forKey: "instagramUsername") as? String
        self.totalCollections = aDecoder.decodeInteger(forKey: "totalCollections")
        self.totalLikes = aDecoder.decodeInteger(forKey: "totalLikes")
        self.totalPhotos = aDecoder.decodeInteger(forKey: "totalPhotos")
        self.acceptedTos = aDecoder.decodeBool(forKey: "acceptedTos")
        self.forHire = aDecoder.decodeBool(forKey: "forHire")
        
    }
}
