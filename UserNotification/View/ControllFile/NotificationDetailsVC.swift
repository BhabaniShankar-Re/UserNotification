//
//  NotificationDetailsVC.swift
//  UserNotification
//
//  Created by Bhabani on 20/04/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class NotificationDetailsVC: UIViewController {
    var labelTitle: String = ""{
        didSet{
            label.text = labelTitle
        }
    }
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutLable()
        NotificationCenter.notificationStatus()
        // Do any additional setup after loading the view.
    }
    
    func layoutLable(){
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Times New Roman", size: 21.0)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
