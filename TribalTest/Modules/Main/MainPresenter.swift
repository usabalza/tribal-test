//
//  MainPresenter.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation


/** Presenter of the Main Module set*/
final class MainPresenter:MainPresenterProtocol{
    
    internal weak var view: MainViewProtocol!
    internal var router: MainRouterProtocol!
    internal var interactor: MainInteractorProtocol!
    var imageArray: [WelcomeElement] = []
    var page: Int = 1
    
    // - MARK: View's Interactions
    func viewDidLoad(){
        view.showLoading()
        interactor.getAllImages(page: page)
    }
    
    func getImageCount() -> Int{
        return imageArray.count
    }
    
    func getImageIn(row: Int) -> WelcomeElement{
        return imageArray[row]
    }
    
    func goToDetail(row: Int) {
        router.route(to: .detail(image: imageArray[row]))
    }
    
    func loadMore() {
        interactor.getAllImages(page: page + 1)
        page = page + 1
        view.reload()
    }
    
    func setFavorite(isFavorite: Bool, row: Int){
        if isFavorite{
            print("Eliminar")
        }else{
            print("Agregar")
        }
    }
    
    deinit {
        print("Main Presenter Destroyed")
    }
}

extension MainPresenter:MainInteractorOutputProtocol{
    func success(_ data: [WelcomeElement]) {
        view.hideLoading()
        /*if page == 1{
            imageArray = data
        }else{
            imageArray.append(contentsOf: data)
        }*/
        imageArray = data
        
        view.reload()
    }
    
    func error(_ message: String) {
        view.hideLoading()
        view.showAlert(title: "Error!", message: message, then: nil)
    }
    
    // MARK: Interactor's Responses
}
