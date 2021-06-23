//
//  FavoritesInteractor.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

/** Interactor of the Favorites Module set*/
final class FavoritesInteractor:FavoritesInteractorProtocol{
    //Bussiness logic goes here
    
    weak var output: FavoritesInteractorOutputProtocol!
    let coreDataService = ServiceLocator.coreDataService()
    
    required init(){}
    
    func getAllFavorites() -> [WelcomeElement] {
        coreDataService.retrieve(WelcomeElement.self)
    }
    
    func delete(model: WelcomeElement) {
        coreDataService.delete(model)
    }
    
    deinit {
        print("Favorites Interactor Destroyed")
    }
}

