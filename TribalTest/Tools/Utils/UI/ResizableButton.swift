//
//  ResizableButton.swift
//  VPOS
//
//  Created by wams macbook ios on 4/21/21.
//  Copyright © 2021 admin. All rights reserved.
//

import Foundation
import UIKit

class ResizableButton: UIButton {
    override var intrinsicContentSize: CGSize {
       let labelSize = titleLabel?.sizeThatFits(CGSize(width: frame.width, height: .greatestFiniteMagnitude)) ?? .zero
       let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right, height: labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom)

       return desiredButtonSize
    }
}
