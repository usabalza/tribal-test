//
//  Sponsorship.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

public class Sponsorship: NSObject, Codable, NSSecureCoding {
    
    public static var supportsSecureCoding: Bool {
        return true
    }
    
    let impressionUrls: [String]
    let tagline: String?
    let taglineURL: String?
    let sponsor: User

    enum CodingKeys: String, CodingKey {
        case impressionUrls = "impression_urls"
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(impressionUrls, forKey: "impressionUrls")
        aCoder.encode(tagline, forKey: "taglines")
        aCoder.encode(taglineURL, forKey: "taglineURL")
        aCoder.encode(sponsor, forKey: "sponsor")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.impressionUrls = aDecoder.decodeObject(forKey: "impressionUrls") as! [String]
        self.tagline = aDecoder.decodeObject(forKey: "tagline") as? String
        self.taglineURL = aDecoder.decodeObject(forKey: "taglineURL") as? String
        self.sponsor = aDecoder.decodeObject(forKey: "sponsor") as! User
    }
}
