//
//  ImageDetailRouter.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

/** Router of the ImageDetail Module set, UIKit Dependent*/
final class  ImageDetailRouter:ViperRouterUIKit,ImageDetailRouterProtocol{
    ///Routes to other viper modules defined in `ImageDetailRoutes`
    func route(to r: ImageDetailRoutes) {
        go { (current) -> (UIViewController) in
            switch r{
            default:
                return UIViewController()
            }
        }
    }
    
    deinit {
        print("ImageDetail Router Destroyed")
    }
}
