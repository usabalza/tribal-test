//
//  LoadingCell.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/23/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import UIKit

class LoadingCell: UICollectionReusableView {
    static let identifier = "LoadingCell"
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
