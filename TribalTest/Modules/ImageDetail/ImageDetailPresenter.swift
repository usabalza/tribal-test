//
//  ImageDetailPresenter.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation


/** Presenter of the ImageDetail Module set*/
final class ImageDetailPresenter:ImageDetailPresenterProtocol{
    
    internal weak var view: ImageDetailViewProtocol!
    internal var router: ImageDetailRouterProtocol!
    internal var interactor: ImageDetailInteractorProtocol!
    var image: WelcomeElement?
    
    // - MARK: View's Interactions
    func viewDidLoad(){
        
    }
    
    func getImage() -> WelcomeElement? {
        return image
    }
    
    func setFavorite() {
        view.showLoading()
        guard let model = image else {return}
        interactor.setFavorite(model: model)
    }
    
    deinit {
        print("ImageDetail Presenter Destroyed")
    }
}

extension ImageDetailPresenter:ImageDetailInteractorOutputProtocol{
    // MARK: Interactor's Responses
    func success(){
        view.hideLoading()
        view.showAlert(title: "Exito", message: "Se ha agregado la foto a favoritos", then: nil)
    }
}
