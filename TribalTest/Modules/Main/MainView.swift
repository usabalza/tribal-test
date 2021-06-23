//
//  MainView.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit
//import UnsplashPhotoPicker

/** View of the Main Module set, UIKit Dependent*/
final class MainView: UIViewController{

    internal var presenter: MainPresenterProtocol!
    var isLoading = false
    var loadingView: LoadingCell?
    
    // - MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    // - MARK: Class Overriden Functions
    
    required convenience init() {
        self.init(nibName: "MainView", bundle: nil)
        navigationItem.title = "Bienvenido!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Code goes here
        //loadPicker()
        loadCollection()
        presenter.viewDidLoad()
    }
    
    func loadCollection(){
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        collectionView.register(UINib.init(nibName: ImageCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.register(UINib.init(nibName: LoadingCell.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LoadingCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    /*func loadPicker(){
        let configuration = UnsplashPhotoPickerConfiguration(
          accessKey: "u_vz47SxO3-U5NWO3593q0uwMBESvJTlL8n4VXuGfeo",
          secretKey: "g-3RMTQ7_WtG2yb_xoq7Yf3J18kMTvukZXwo1xWhoRQ"
        )

        let photoPicker = UnsplashPhotoPicker(configuration: configuration)
        photoPicker.photoPickerDelegate = self as? UnsplashPhotoPickerDelegate

        present(photoPicker, animated: true, completion: nil)
    }*/
    
    deinit {
        print("Main View Destroyed")
    }
    
    // - MARK: IBActions and User's Interaction
    
}


extension MainView:MainViewProtocol{
    
    // - MARK: GUI's animation and setup
    func showLoading() {
        customNavigation?.showLoading()
    }
    
    func hideLoading() {
        customNavigation?.hideLoading()
    }
    
    func reload(){
        collectionView.reloadData()
    }
    
    // - MARK: Data reciever
    
    
}

extension MainView: PinterestLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    return CGFloat(presenter.getImageIn(row: indexPath.row).height / 30)
  }
}

extension MainView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getImageCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.tag = indexPath.row
        cell.setup(model: presenter.getImageIn(row: indexPath.row))
        cell.setFavorite = presenter.setFavorite
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.goToDetail(row: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if self.isLoading {
            return CGSize.zero
        } else {
            return CGSize(width: collectionView.bounds.size.width, height: 55)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionFooter {
                let aFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LoadingCell.identifier, for: indexPath) as! LoadingCell
                loadingView = aFooterView
                loadingView?.backgroundColor = UIColor.clear
                return aFooterView
            }
            return UICollectionReusableView()
        }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize.init(width: presenter.getImageIn(row: indexPath.row).width / 20, height: presenter.getImageIn(row: indexPath.row).height / 20)
        return size
    }*/
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingView?.spinner.startAnimating()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingView?.spinner.stopAnimating()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == presenter.getImageCount() - 10 && !self.isLoading {
            presenter.loadMore()
        }
    }
    
    
    
}

