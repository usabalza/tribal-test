//
//  ImageCell.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static let identifier = "ImageCell"
    var isFavorite = false
    var setFavorite: ((Bool, Int) -> ())? = nil
    @IBOutlet weak var containerView: CustomView!
    @IBOutlet weak var fullImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var likes: UILabel!
    
    @IBOutlet weak var favoriteButton: CustomButton!
    @IBAction func favoriteAction(_ sender: Any) {
        setFavorite?(isFavorite, self.tag)
        isFavorite.toggle()
        favoriteButton.setImage(UIImage(named: isFavorite ? "favoriteFilled" : "favorite"), for: .normal) 
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(model: WelcomeElement){
        if let url = URL.init(string: model.urls.full){
            fullImage.cache(from: url, placeholder: UIImage(named: "placeholder"))
        }else{
            fullImage.image = UIImage(named: "placeholderNoImg")
        }
        if let url = URL.init(string: model.user.profileImage.medium){
            profileImage.cache(from: url, placeholder: UIImage(named: "placeholder"))
        }else{
            profileImage.image = UIImage(named: "placeholderNoImg")
        }
        userName.text = model.user.username
        likes.text = "\(model.likes)"
        
        
    }

}
