//
//  FavoritesContract.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

// - MARK: Contract

protocol FavoritesViewProtocol:ViperView{
    var presenter: FavoritesPresenterProtocol!{get set}
    func reload()
}

protocol FavoritesPresenterProtocol:ViperPresenter{
    var view:FavoritesViewProtocol!{get set}
    var router: FavoritesRouterProtocol!{set get}
    var interactor: FavoritesInteractorProtocol!{set get}

    func viewDidLoad()
    func getFavoritesCount() -> Int
    func getFavoriteIn(row: Int) -> WelcomeElement
    func reloadFavorites()
    func goToDetail(row: Int)
    func setFavorite(isFavorite: Bool, row: Int)
}

protocol FavoritesInteractorProtocol:ViperInteractor{
    var output: FavoritesInteractorOutputProtocol!{get set}
    func getAllFavorites() -> [WelcomeElement]
    func delete(model: WelcomeElement)
}

protocol FavoritesInteractorOutputProtocol:class{

}

protocol FavoritesRouterProtocol:class{
    func route(to:FavoritesRoutes)
}

// - MARK: Contract Enums

enum FavoritesRoutes{
    case detail(image: WelcomeElement)
}


//DONT TOUCH THESE PLEASE

extension FavoritesViewProtocol{
    func set(_ presenter: ViperPresenter) {
        self.presenter = presenter as? FavoritesPresenterProtocol
    }
}

extension FavoritesPresenterProtocol{
    func set(_ view:ViperView){
        self.view = view as? FavoritesViewProtocol
    }
    func set(_ router:ViperRouter){
        self.router = router as? FavoritesRouterProtocol
    }
    func set(_ interactor:ViperInteractor){
        self.interactor = interactor as? FavoritesInteractorProtocol
    }
}

extension FavoritesInteractorProtocol{
    func set(_ output:ViperPresenter){
        self.output = output as? FavoritesInteractorOutputProtocol
    }
}

