//
//  UserProfileCell.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import UIKit

class UserProfileCell: UITableViewCell {
    
    static let identifier = "UserProfileCell"
    @IBOutlet weak var containerView: CustomView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: WelcomeElement){
        if let url = URL.init(string: model.user.profileImage.medium){
            profileImage.cache(from: url, placeholder: UIImage(named: "placeholder"))
        }else{
            profileImage.image = UIImage(named: "placeholderNoImg")
        }
        containerView.borderColor = UIColor(hex: model.color)
        userNameLabel.text = "\(model.user.firstName) \(model.user.lastName ?? "") (\(model.user.username))"
    }
    
}
