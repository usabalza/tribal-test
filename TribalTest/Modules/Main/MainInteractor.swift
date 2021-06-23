//
//  MainInteractor.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

/** Interactor of the Main Module set*/
final class MainInteractor:MainInteractorProtocol{
    //Bussiness logic goes here
    
    weak var output: MainInteractorOutputProtocol!
    let service = ServiceLocator.imageService()
    
    required init(){}
    
    func getAllImages(page: Int) {
        service.getAll(page: page) {[weak self] (response) in
            guard let self = self else {return}
            switch response{
            case let .success(model):
                self.output.success(model)
            case let .failure(error):
                self.output.error(error)
            }
        }
    }
    
    deinit {
        print("Main Interactor Destroyed")
    }
}

