//
//  Builders.swift
//  EasyMusic
//
//  Created by Moi on 12/2/18.
//  Copyright © 2018 Moi. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    enum eStyle{
        case btn1(title:String)
    }
    
    static func style(_ st:eStyle)->UIButton?{
        switch st {
        case .btn1(let title):
            let btn = UIButton.init()
            btn.setTitle(title, for: .normal)
            btn.tintColor = .blue
            btn.backgroundColor = .lightGray
            btn.setTitleColor(.black, for: .normal)
            btn.setTitleColor(.darkGray, for: .selected)
            return btn
        }
    }
    
}
