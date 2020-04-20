//
//  TableViewCell.swift
//  UserNotification
//
//  Created by Bhabani on 20/04/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell{
    @IBOutlet weak var labelName: UILabel!
    
    
    func assignNametoLable(index: Int){
        switch index {
        case 0:
            labelName.text = "1st Notification Type"
        case 1:
            labelName.text = "2nd Notification Type"
        case 2:
            labelName.text = "3rd Notification Type"
        default:
            labelName.text = "\(index + 1)th Notification Type"
        }
    }
}
