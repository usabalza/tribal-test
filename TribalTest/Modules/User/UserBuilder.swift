//
//  UserBuilder.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

protocol UserModuleInterface:class{
    func `default`()->UIViewController
}

final class UserModule: ViperModuleBuilder<UserView,UserPresenter,UserInteractor,UserRouter>,UserModuleInterface{
    public override class func identifier()->String{
        return "UserModule"
    }
    
    func `default`() -> UIViewController {
        return object.imp.view
    }
    
    deinit {
        print("User Builder Destroyed")
    }
    
}
