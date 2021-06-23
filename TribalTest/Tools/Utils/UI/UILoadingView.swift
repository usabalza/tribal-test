//
//  UILoadingView.swift
//  ThePilot
//
//  Created by Anthony on 22/2/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import Foundation
import UIKit

class UILoadingView : UIView {
    
    init(frame rect: CGRect, text: String = "Loading...") {
        super.init(frame: rect)
        self.isUserInteractionEnabled = true
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5532962329)
        self.spinner.tintColor = UIColor.cerulean
        self.spinner.color =  UIColor.cerulean
        self.label.text = text
        self.label.textColor = self.spinner.color
        self.spinner.startAnimating()
        
        self.addSubview(self.label)
        self.addSubview(self.spinner)
        
        self.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue)
        
        self.setNeedsLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var label : UILabel = {
        var l = UILabel()
        l.font = UIFont.init(name: "OpenSans-bold", size: 17)
        return l
    }()
    
    var spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    override func layoutSubviews() {
        let labelString: String = self.label.text!
        let labelSize: CGSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.label.font])
        var labelFrame: CGRect = CGRect()
        labelFrame.size = labelSize
        self.label.frame = labelFrame
        
        // center label and spinner
        self.label.center = self.center
        self.spinner.center = self.center
        
        // horizontally align
        labelFrame = self.label.frame
        var spinnerFrame: CGRect = self.spinner.frame
        let totalWidth: CGFloat = spinnerFrame.size.width + 5 + labelSize.width
        spinnerFrame.origin.x = self.bounds.origin.x + (self.bounds.size.width - totalWidth) / 2
        labelFrame.origin.x = spinnerFrame.origin.x + spinnerFrame.size.width + 5
        self.label.frame = labelFrame
        self.spinner.frame = spinnerFrame
        
        self.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
        }
    }
    
}
