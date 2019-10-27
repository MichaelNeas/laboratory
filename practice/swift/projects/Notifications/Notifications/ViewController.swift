//
//  ViewController.swift
//  Notifications
//
//  Created by Michael Neas on 10/26/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
    }
    
    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Aye")
            } else {
                print("Awe")
            }
        }
    }

    @objc func scheduleLocal() {
        registerCategories()
        
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        // what should be shown inside the alert
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
        //type of alert
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        
        // trigger, when they should be shown
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // new random string
        // combine the content with the trigger
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Tell me more..", options: .foreground)
        let crow = UNNotificationAction(identifier: "crow", title: "Tell me crow..", options: .foreground)
        let remindMeLater = UNNotificationAction(identifier: "remind", title: "Remind me later", options: .foreground)
        // matches up to schedle categoryIdentifier
        let category = UNNotificationCategory(identifier: "alarm", actions: [show, crow, remindMeLater], intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])
    }
    
    // can escape the current method and be used later on
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if let customData = userInfo["customData"] as? String {
            print("Custom data received \(customData)")
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // swiped to unlock
                print("Default Identifier")
            case "show":
                print("Show more information!")
                let ac = UIAlertController(title: "More Information", message: "Thanks for choosing more information", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
                present(ac, animated: true)
            case "crow":
                let ac = UIAlertController(title: "Crow Information", message: "Thanks for choosing more crows", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
                present(ac, animated: true)
            case "remind":
                scheduleLocal()
            default:
                break
            }
        }
        
        completionHandler()
    }
}
