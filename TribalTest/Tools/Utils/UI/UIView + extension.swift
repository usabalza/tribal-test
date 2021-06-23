//
//  UIView + extension.swift
//  ThePilot
//
//  Created by Anthony on 21/2/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func addShadow(color: UIColor = .black,radius: CGFloat = 1, offset: CGSize = CGSize.init(width: 0, height: 0),opacity : Float = 1){
        
        self.clipsToBounds = false
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
    }
    
}
