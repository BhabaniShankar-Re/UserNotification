//
//  ViewController.swift
//  UserNotification
//
//  Created by Bhabani on 19/04/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class TypeOfNotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "DetailsNotificationVCstbId":
            let vc = segue.destination as! NotificationDetailsVC
            vc.labelTitle = sender as! String
        default:
            break
        }
    }


}

extension TypeOfNotificationVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        reuseCell.assignNametoLable(index: indexPath.row)
        return reuseCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath) as! TableViewCell
        self.performSegue(withIdentifier: "DetailsNotificationVCstbId", sender: currentCell.labelName.text)
    }
    
    
}

