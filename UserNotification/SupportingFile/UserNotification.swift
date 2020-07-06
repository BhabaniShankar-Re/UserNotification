//
//  UserNotification.swift
//  UserNotification
//
//  Created by Bhabani on 22/06/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import Foundation
import UserNotifications

class UserNotification {
    static let notification = UserNotification()
    let notification = UNUserNotificationCenter.current()
    
    func notificationSettingStatus(){
        notification.getNotificationSettings { (setting) in
            switch setting.authorizationStatus{
            case .authorized:
                print("authorized")
                break
            case .denied:
                Alert.show(title: "Notification", message: "To get reminder please allow this app for notification in setting")
                break
            default:
                break
            }
        }
    }
    
}
