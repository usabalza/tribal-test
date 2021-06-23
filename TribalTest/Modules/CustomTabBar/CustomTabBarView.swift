//
//  CustomTabBarView.swift
//  VPOS
//
//  Created by WAMS  on 20/12/18.
//  Copyright © 2018 WAMS C.A. All rights reserved.
//

import Foundation
import UIKit

/** View of the CustomTabBar Module set, UIKit Dependent*/
final class CustomTabBarView: UITabBarController{
    
//    let service = ServiceLocator.deviceService()
//    static var lastSelected:Int = 0
    // - MARK: IBOutlets
    
    
    // - MARK: Class Overriden Functions
    
    required convenience init() {
        self.init(nibName: "CustomTabBarView", bundle: nil)
        //self.hero.isEnabled = true
        //self.hero.modalAnimationType = .selectBy(presenting:.push(direction: .left), dismissing: .pull(direction: .left))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Code goes here
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.tintColor = UIColor.cerulean
        self.selectedIndex = 0
    }
    
    // - MARK: IBActions and User's Interaction
    
    
}

