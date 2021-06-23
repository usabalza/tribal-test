//
//  ImageDetailContract.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

// - MARK: Contract

protocol ImageDetailViewProtocol:ViperView{
    var presenter: ImageDetailPresenterProtocol!{get set}
    func showLoading()
    func hideLoading()
}

protocol ImageDetailPresenterProtocol:ViperPresenter{
    var view:ImageDetailViewProtocol!{get set}
    var router: ImageDetailRouterProtocol!{set get}
    var interactor: ImageDetailInteractorProtocol!{set get}

    func viewDidLoad()
    func getImage() -> WelcomeElement?
    func setFavorite()
}

protocol ImageDetailInteractorProtocol:ViperInteractor{
    var output: ImageDetailInteractorOutputProtocol!{get set}
    func setFavorite(model: WelcomeElement)
}

protocol ImageDetailInteractorOutputProtocol:class{
    func success()
}

protocol ImageDetailRouterProtocol:class{
    func route(to:ImageDetailRoutes)
}

// - MARK: Contract Enums

enum ImageDetailRoutes{
    
}


//DONT TOUCH THESE PLEASE

extension ImageDetailViewProtocol{
    func set(_ presenter: ViperPresenter) {
        self.presenter = presenter as? ImageDetailPresenterProtocol
    }
}

extension ImageDetailPresenterProtocol{
    func set(_ view:ViperView){
        self.view = view as? ImageDetailViewProtocol
    }
    func set(_ router:ViperRouter){
        self.router = router as? ImageDetailRouterProtocol
    }
    func set(_ interactor:ViperInteractor){
        self.interactor = interactor as? ImageDetailInteractorProtocol
    }
}

extension ImageDetailInteractorProtocol{
    func set(_ output:ViperPresenter){
        self.output = output as? ImageDetailInteractorOutputProtocol
    }
}

