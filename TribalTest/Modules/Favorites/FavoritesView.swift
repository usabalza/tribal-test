//
//  FavoritesView.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

/** View of the Favorites Module set, UIKit Dependent*/
final class FavoritesView: UIViewController{

    internal var presenter: FavoritesPresenterProtocol!
    
    // - MARK: IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // - MARK: Class Overriden Functions
    
    required convenience init() {
        self.init(nibName: "FavoritesView", bundle: nil)
        navigationItem.title = "Favoritos"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Code goes here
        
        
        loadCollection()
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.reloadFavorites()
    }
    
    func loadCollection(){
        collectionView.register(UINib.init(nibName: ImageCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    deinit {
        print("Favorites View Destroyed")
    }
    
    // - MARK: IBActions and User's Interaction
    
    
}


extension FavoritesView:FavoritesViewProtocol{
    
    // - MARK: GUI's animation and setup
    
    func reload(){
        collectionView.reloadData()
    }
    // - MARK: Data reciever
    
    
}

extension FavoritesView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getFavoritesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.tag = indexPath.row
        cell.setup(model: presenter.getFavoriteIn(row: indexPath.row))
        cell.isFavorite = true
        cell.setFavorite = presenter.setFavorite
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var dynamicSize = Double(collectionView.frame.width / 2)
        let space = 9.0
        dynamicSize -= space
        let cellSize = CGSize(width: dynamicSize, height: dynamicSize)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.goToDetail(row: indexPath.row)
    }
    
    
}
