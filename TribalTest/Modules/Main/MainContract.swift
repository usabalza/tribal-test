//
//  MainContract.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

// - MARK: Contract

protocol MainViewProtocol:ViperView{
    var presenter: MainPresenterProtocol!{get set}
    func showLoading()
    func hideLoading()
    func reload()
}

protocol MainPresenterProtocol:ViperPresenter{
    var view:MainViewProtocol!{get set}
    var router: MainRouterProtocol!{set get}
    var interactor: MainInteractorProtocol!{set get}

    func viewDidLoad()
    func getImageCount() -> Int
    func getImageIn(row: Int) -> WelcomeElement
    func goToDetail(row: Int)
    func loadMore()
    func setFavorite(isFavorite: Bool, row: Int)
}

protocol MainInteractorProtocol:ViperInteractor{
    var output: MainInteractorOutputProtocol!{get set}
    func getAllImages(page: Int)
}

protocol MainInteractorOutputProtocol:class{
    func success(_ data: [WelcomeElement])
    func error(_ message: String)

}

protocol MainRouterProtocol:class{
    func route(to:MainRoutes)
}

// - MARK: Contract Enums

enum MainRoutes{
    case detail(image: WelcomeElement)
}


//DONT TOUCH THESE PLEASE

extension MainViewProtocol{
    func set(_ presenter: ViperPresenter) {
        self.presenter = presenter as? MainPresenterProtocol
    }
}

extension MainPresenterProtocol{
    func set(_ view:ViperView){
        self.view = view as? MainViewProtocol
    }
    func set(_ router:ViperRouter){
        self.router = router as? MainRouterProtocol
    }
    func set(_ interactor:ViperInteractor){
        self.interactor = interactor as? MainInteractorProtocol
    }
}

extension MainInteractorProtocol{
    func set(_ output:ViperPresenter){
        self.output = output as? MainInteractorOutputProtocol
    }
}

