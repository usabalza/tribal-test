//
//  UserRouter.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

/** Router of the User Module set, UIKit Dependent*/
final class  UserRouter:ViperRouterUIKit,UserRouterProtocol{
    ///Routes to other viper modules defined in `UserRoutes`
    func route(to r: UserRoutes) {
        go { (current) -> (UIViewController) in
            switch r{
            default:
                return UIViewController()
            }
        }
    }
    
    deinit {
        print("User Router Destroyed")
    }
}
