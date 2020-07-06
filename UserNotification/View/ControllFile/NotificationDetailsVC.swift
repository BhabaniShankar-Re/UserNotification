//
//  NotificationDetailsVC.swift
//  UserNotification
//
//  Created by Bhabani on 20/04/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit
import UserNotifications

enum NotificationType{
    case timeInterval
    case calender
    case location
}

class NotificationDetailsVC: UIViewController {
    
    var notificationType: NotificationType!
   
    @IBOutlet weak var timeintervalLable: UILabel!
    @IBOutlet weak var schdulerLable: UILabel!
    @IBOutlet weak var liveTimeLabel: UILabel!
    @IBOutlet weak var scheduleTimeField: UITextField!
    @IBOutlet weak var timeIntervalField: UITextField!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutLable()
        UserNotification.notification.notificationSettingStatus()
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
            self.liveTimeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        }
        switch notificationType {
        case .calender:
            timeIntervalField.isUserInteractionEnabled = false
            timeintervalLable.textColor = UIColor.lightGray
        case .timeInterval:
            schdulerLable.textColor = UIColor.lightGray
            scheduleTimeField.isUserInteractionEnabled = false
        default:
            return
        }
    }
    
    
    
    func layoutLable(){
        
        datePicker.sizeToFit()
        datePicker.datePickerMode = .time
        scheduleTimeField.inputView = datePicker
        let toolbutton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        
//        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissKeyboard))
        let toolbar = UIToolbar()
        toolbar.items = [toolbutton]
        toolbar.sizeToFit()
        scheduleTimeField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard(){
        let formater = DateFormatter()
        formater.dateFormat = "hh:mm:ss a"
        let strdate = formater.string(from: datePicker.date)
        scheduleTimeField.text = strdate
        view.endEditing(true)
    }
    
    func showLocalNotification(time: Int){
        
//        let data = UIImage(named: "window-flower")!.pngData()
//            let filestr = "window-flower"
//             let fileurl = FileManager.default.temporaryDirectory.appendingPathComponent(filestr)
//              do{
//                  try data?.write(to: fileurl, options: [])
//              }catch let error{
//                  print(error.localizedDescription)
//              }
        
        let content = UNMutableNotificationContent()
        content.title = "New Notification"
        content.subtitle = "The 1st Notification"
        content.body = "This is test notificaiton"
        content.sound = .default
        
        let imageurl = Bundle.main.url(forResource: "window-flower", withExtension: "jpg")
        print(imageurl as Any)

        let contentImage = try? UNNotificationAttachment(identifier: "image", url: imageurl!, options: [:])
        content.attachments = [contentImage!]
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(time), repeats: false)
        let uidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uidString, content: content, trigger: trigger)
        UserNotification.notification.notification.add(request) { (error) in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
    func showLocalCalenderNotification(date: Date){
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        var dateco = DateComponents()
        dateco.hour = hour
        dateco.minute = minute
        
        let content = UNMutableNotificationContent()
        content.title = "Calender Notification"
        content.body = "Calender Notification of time \(hour).\(minute)"
        content.sound = .default

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateco, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UserNotification.notification.notification.add(request) { (error) in
            print(error?.localizedDescription as Any)
        }
    }
    
    @IBAction func triggerAction(_ sender: Any) {
        view.endEditing(true)
        switch notificationType {
        case .timeInterval:
            if let timestr = timeIntervalField.text, !timestr.isEmpty, let time = Int(timestr){
                showLocalNotification(time: time)
            }else{
                Alert.show(title: "Attention", message: "Enter time to trigger.")
            }
        case .calender:
            if let timestr = scheduleTimeField.text, !timestr.isEmpty{
                let formater = DateFormatter()
                formater.dateFormat = "hh:mm:ss a"
                formater.timeZone = TimeZone(secondsFromGMT: 0)
                
                if let date = formater.date(from: timestr){
                    showLocalCalenderNotification(date: date)
                }else{
                    Alert.show(title: "Error", message: "Time can't handle by the Dateformatter.")
                }
            }else{
               Alert.show(title: "Attention", message: "Enter time to trigger.")
            }
        default:
            return
        }
    }
    
    

}
