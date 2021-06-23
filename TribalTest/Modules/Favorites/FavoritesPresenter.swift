//
//  FavoritesPresenter.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation


/** Presenter of the Favorites Module set*/
final class FavoritesPresenter:FavoritesPresenterProtocol{
    
    internal weak var view: FavoritesViewProtocol!
    internal var router: FavoritesRouterProtocol!
    internal var interactor: FavoritesInteractorProtocol!
    var favoritesArray: [WelcomeElement] = []
    
    // - MARK: View's Interactions
    func viewDidLoad(){
        
        //interactor.getAllFavorites()
    }
    
    func reloadFavorites() {
        favoritesArray = interactor.getAllFavorites()
        view.reload()
    }
    
    func getFavoritesCount() -> Int{
        return favoritesArray.count
    }
    
    func getFavoriteIn(row: Int) -> WelcomeElement{
        return favoritesArray[row]
    }
    
    func goToDetail(row: Int) {
        router.route(to: .detail(image: favoritesArray[row]))
    }
    
    func setFavorite(isFavorite: Bool, row: Int){
        if isFavorite{
            print("Eliminar")
            interactor.delete(model: favoritesArray[row])
            favoritesArray.remove(at: row)
            view.reload()
        }else{
            print("Agregar")
        }
    }
    
    deinit {
        print("Favorites Presenter Destroyed")
    }
}

extension FavoritesPresenter:FavoritesInteractorOutputProtocol{
    // MARK: Interactor's Responses
}
