//
//  Notifications.swift
//  IF_Employee
//
//  Created by gec on 04/03/20.
//  Copyright © 2020 gec. All rights reserved.
//

import Foundation
import UserNotifications

func notification(_ title: String, _ body: String){
    let center = UNUserNotificationCenter.current()
    
    center.requestAuthorization(options: [.alert,.sound]) { (granted, error) in
        
    }
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
    
    let date = Date().addingTimeInterval(2)
    let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    let req = UNNotificationRequest(identifier: "ddd", content: content, trigger: trigger)
    center.add(req) { (error) in
        
    }
    

}

