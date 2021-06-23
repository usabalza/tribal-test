//
//  CustomNavBarView.swift
//  ThePilot
//
//  Created by Anthony on 19/2/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit
//import UnsplashPhotoPicker

class CustomNavBarView: UINavigationController {

    var loadingView: UILoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadPicker()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.view.backgroundColor = .clear
        self.navigationBar.isTranslucent = true
        self.navigationBar.barTintColor = UIColor.clear
        self.navigationBar.tintColor = UIColor.principalText
        /*self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor :  UIColor.principalText,
            NSAttributedString.Key.font : UIFont.init(name: "OpenSans-Semibold", size: 18)!
        ]*/
    
        // Do any additional setup after loading the view.
    }
    
    
    
    func showLoading(){
        loadingView?.removeFromSuperview()
        loadingView = nil
        loadingView = UILoadingView.init(frame: view.bounds, text: "Cargando...")
        self.view.addSubview(loadingView!)
    }
    
    func hideLoading(){
        loadingView?.removeFromSuperview()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
