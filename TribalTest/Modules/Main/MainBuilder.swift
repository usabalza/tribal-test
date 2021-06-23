//
//  MainBuilder.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

protocol MainModuleInterface:class{
    func `default`()->UIViewController
}

final class MainModule: ViperModuleBuilder<MainView,MainPresenter,MainInteractor,MainRouter>,MainModuleInterface{
    public override class func identifier()->String{
        return "MainModule"
    }
    
    func `default`() -> UIViewController {
        return object.imp.view
    }
    
    deinit {
        print("Main Builder Destroyed")
    }
    
}
