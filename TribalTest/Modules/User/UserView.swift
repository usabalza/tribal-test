//
//  UserView.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation
import UIKit

/** View of the User Module set, UIKit Dependent*/
final class UserView: UIViewController{

    internal var presenter: UserPresenterProtocol!
    
    // - MARK: IBOutlets
    
    
    // - MARK: Class Overriden Functions
    
    required convenience init() {
        self.init(nibName: "UserView", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Code goes here
        
        
        
        presenter.viewDidLoad()
    }
    
    deinit {
        print("User View Destroyed")
    }
    
    // - MARK: IBActions and User's Interaction
    
    
}


extension UserView:UserViewProtocol{
    
    // - MARK: GUI's animation and setup
    
    
    // - MARK: Data reciever
    
    
}
