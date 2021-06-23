//
//  ImageDetailBuilder.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

protocol ImageDetailModuleInterface:class{
    func `default`()->UIViewController
    func custom(image: WelcomeElement)->UIViewController
}

final class ImageDetailModule: ViperModuleBuilder<ImageDetailView,ImageDetailPresenter,ImageDetailInteractor,ImageDetailRouter>,ImageDetailModuleInterface{
    
    public override class func identifier()->String{
        return "ImageDetailModule"
    }
    
    func `default`() -> UIViewController {
        return object.imp.view
    }
    
    func custom(image: WelcomeElement) -> UIViewController {
        object.imp.presenter.image = image
        return object.imp.view
    }
    
    deinit {
        print("ImageDetail Builder Destroyed")
    }
    
}
