//
//  MainRouter.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

/** Router of the Main Module set, UIKit Dependent*/
final class  MainRouter:ViperRouterUIKit,MainRouterProtocol{
    ///Routes to other viper modules defined in `MainRoutes`
    func route(to r: MainRoutes) {
        go { (current) -> (UIViewController) in
            switch r{
            case let .detail(image):
                let detvc = ImageDetailModule().custom(image: image)
                current?.navigationController?.pushViewController(detvc, animated: true)
            }
            return .init()
        }
        
    }
    
    deinit {
        print("Main Router Destroyed")
    }
}
