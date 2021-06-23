//
//  UserPresenter.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation


/** Presenter of the User Module set*/
final class UserPresenter:UserPresenterProtocol{
    
    internal weak var view: UserViewProtocol!
    internal var router: UserRouterProtocol!
    internal var interactor: UserInteractorProtocol!
    
    // - MARK: View's Interactions
    func viewDidLoad(){
        
    }
    
    deinit {
        print("User Presenter Destroyed")
    }
}

extension UserPresenter:UserInteractorOutputProtocol{
    // MARK: Interactor's Responses
}
