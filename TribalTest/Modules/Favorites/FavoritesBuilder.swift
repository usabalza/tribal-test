//
//  FavoritesBuilder.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

protocol FavoritesModuleInterface:class{
    func `default`()->UIViewController
}

final class FavoritesModule: ViperModuleBuilder<FavoritesView,FavoritesPresenter,FavoritesInteractor,FavoritesRouter>,FavoritesModuleInterface{
    public override class func identifier()->String{
        return "FavoritesModule"
    }
    
    func `default`() -> UIViewController {
        return object.imp.view
    }
    
    deinit {
        print("Favorites Builder Destroyed")
    }
    
}
