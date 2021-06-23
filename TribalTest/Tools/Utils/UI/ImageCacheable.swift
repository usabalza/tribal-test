//
//  ImageCacheProtocol.swift
//  VPOS
//
//  Created by WAMS  on 17/12/18.
//  Copyright © 2018 WAMS C.A. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

extension UIImageView{
    func cache(from url:URL){
        self.af_setImage(withURL: url)
    }
    func cache(from url: URL, placeholder: UIImage?){
        self.af_setImage(withURL: url, placeholderImage: placeholder)
    }
}
