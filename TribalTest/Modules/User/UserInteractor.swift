//
//  UserInteractor.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

/** Interactor of the User Module set*/
final class UserInteractor:UserInteractorProtocol{
    //Bussiness logic goes here
    
    weak var output: UserInteractorOutputProtocol!
    
    required init(){}
    
    deinit {
        print("User Interactor Destroyed")
    }
}

