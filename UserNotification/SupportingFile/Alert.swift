//
//  Alert.swift
//  UserNotification
//
//  Created by Bhabani on 20/04/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class Alert {
    static var alertController = UIAlertController()
    
    static func show(title: String, message: String){
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Allow", style: .default) { (action) in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:]) { (isSuccess) in
                print(isSuccess)
            }
        }
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(action)
        alertController.addAction(dismiss)
        
        var keyWindow: UIWindow?
        if #available(iOS 13.0, *){
            keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        }else{
            keyWindow = UIApplication.shared.keyWindow
        }
        

        
        keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
}
