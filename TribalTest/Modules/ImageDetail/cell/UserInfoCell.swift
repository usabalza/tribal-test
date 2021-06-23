//
//  UserInfoCell.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import UIKit

class UserInfoCell: UITableViewCell {
    
    static let identifier = "UserInfoCell"
    var mode = 0

    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: WelcomeElement){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yyyy HH:mm"
        guard let c = formatter.date(from: model.createdAt) else {return}
        guard let u = formatter.date(from: model.updatedAt) else {return}
        dateTitle.text = mode == 2 ? "Fecha de creación" : "Fecha de modificación"
        dateLabel.text = mode == 2 ? "\(c)" : "\(u)"
    }
    
    func setCase(number: Int){
        mode = number
    }
    
}
