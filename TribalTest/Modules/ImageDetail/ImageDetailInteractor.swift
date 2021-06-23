//
//  ImageDetailInteractor.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

/** Interactor of the ImageDetail Module set*/
final class ImageDetailInteractor:ImageDetailInteractorProtocol{
    //Bussiness logic goes here
    
    weak var output: ImageDetailInteractorOutputProtocol!
    let coreDataService = ServiceLocator.coreDataService()
    
    required init(){}
    
    func setFavorite(model: WelcomeElement) {
        coreDataService.create(model, save: true)
        output.success()
    }
    
    deinit {
        print("ImageDetail Interactor Destroyed")
    }
}

