//
//  ImageDetailCell.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import UIKit

class ImageDetailCell: UITableViewCell {
    var isFavorite = false
    static let identifier = "ImageDetailCell"
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var containerView: CustomView!
    @IBOutlet weak var favoriteButton: CustomButton!
    @IBOutlet weak var titleLabel: UILabel!
    var setFavorite: (() -> ())? = nil
    
    @IBAction func favoriteAction(_ sender: Any) {
        setFavorite?()
        isFavorite.toggle()
        favoriteButton.setImage(UIImage(named: isFavorite ? "favoriteFilled" : "favorite"), for: .normal) 
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: WelcomeElement){
        if let url = URL.init(string: model.urls.full){
            detailImage.cache(from: url, placeholder: UIImage(named: "placeholder"))
        }else{
            detailImage.image = UIImage(named: "placeholderNoImg")
        }
        titleLabel.text = model.welcomeDescription ?? model.altDescription ?? "Sin descripción disponible."
    }
    
}
