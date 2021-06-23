//
//  UserContract.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

// - MARK: Contract

protocol UserViewProtocol:ViperView{
    var presenter: UserPresenterProtocol!{get set}
}

protocol UserPresenterProtocol:ViperPresenter{
    var view:UserViewProtocol!{get set}
    var router: UserRouterProtocol!{set get}
    var interactor: UserInteractorProtocol!{set get}

    func viewDidLoad()
}

protocol UserInteractorProtocol:ViperInteractor{
    var output: UserInteractorOutputProtocol!{get set}
}

protocol UserInteractorOutputProtocol:class{

}

protocol UserRouterProtocol:class{
    func route(to:UserRoutes)
}

// - MARK: Contract Enums

enum UserRoutes{
    
}


//DONT TOUCH THESE PLEASE

extension UserViewProtocol{
    func set(_ presenter: ViperPresenter) {
        self.presenter = presenter as? UserPresenterProtocol
    }
}

extension UserPresenterProtocol{
    func set(_ view:ViperView){
        self.view = view as? UserViewProtocol
    }
    func set(_ router:ViperRouter){
        self.router = router as? UserRouterProtocol
    }
    func set(_ interactor:ViperInteractor){
        self.interactor = interactor as? UserInteractorProtocol
    }
}

extension UserInteractorProtocol{
    func set(_ output:ViperPresenter){
        self.output = output as? UserInteractorOutputProtocol
    }
}

