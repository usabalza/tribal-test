//
//  ImageDetailView.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

/** View of the ImageDetail Module set, UIKit Dependent*/
final class ImageDetailView: UIViewController{

    internal var presenter: ImageDetailPresenterProtocol!
    
    // - MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // - MARK: Class Overriden Functions
    
    required convenience init() {
        self.init(nibName: "ImageDetailView", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Code goes here
        
        
        loadTable()
        presenter.viewDidLoad()
    }
    
    func loadTable(){
        tableView.register(UINib.init(nibName: ImageDetailCell.identifier, bundle: nil), forCellReuseIdentifier: ImageDetailCell.identifier)
        tableView.register(UINib.init(nibName: UserProfileCell.identifier, bundle: nil), forCellReuseIdentifier: UserProfileCell.identifier)
        tableView.register(UINib.init(nibName: UserInfoCell.identifier, bundle: nil), forCellReuseIdentifier: UserInfoCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }
    
    deinit {
        print("ImageDetail View Destroyed")
    }
    
    // - MARK: IBActions and User's Interaction
    
    
}


extension ImageDetailView:ImageDetailViewProtocol{
    
    // - MARK: GUI's animation and setup
    func showLoading(){
        customNavigation?.showLoading()
    }
    func hideLoading(){
        customNavigation?.hideLoading()
    }
    /*func setup(model: WelcomeElement){
        if let url = URL.init(string: model.urls.full){
            detailImage.cache(from: url, placeholder: UIImage(named: "placeholder"))
        }else{
            detailImage.image = UIImage(named: "placeholderNoImg")
        }
        
        if let url = URL.init(string: model.user.profileImage.medium){
            profileImage.cache(from: url, placeholder: UIImage(named: "placeholder"))
        }else{
            profileImage.image = UIImage(named: "placeholderNoImg")
        }
        descriptionLabel.text = model.welcomeDescription ?? model.altDescription ?? "Sin descripción disponible"
        containerImage.borderColor = UIColor(hex: model.color)
        userNameLabel.text = "\(model.user.firstName) \(model.user.lastName ?? "") (\(model.user.username))"
        createdLabel.text = "\(model.createdAt)"
        updatedLabel.text = "\(model.updatedAt)"
    }*/
    
    // - MARK: Data reciever
    
    
}

extension ImageDetailView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageDetailCell.identifier, for: indexPath) as! ImageDetailCell
            guard let model = presenter.getImage() else {return cell}
            cell.setup(model: model)
            cell.setFavorite = presenter.setFavorite
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserProfileCell.identifier, for: indexPath) as! UserProfileCell
            guard let model = presenter.getImage() else {return cell}
            cell.setup(model: model)
            return cell
        case 2, 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoCell.identifier, for: indexPath) as! UserInfoCell
            guard let model = presenter.getImage() else {return cell}
            cell.setCase(number: indexPath.row)
            cell.setup(model: model)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageDetailCell.identifier, for: indexPath) as! ImageDetailCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0: return 300
        case 1: return 150
        case 2, 3: return 50
        default: return 50
        }
    }
    
    
}
