//
//  NotificationCenter.swift
//  UserNotification
//
//  Created by Bhabani on 20/04/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import Foundation
import UserNotifications
class NotificationCenter{
    static let notification = UNUserNotificationCenter.current()
    
    static func notificationStatus() -> Void{
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
