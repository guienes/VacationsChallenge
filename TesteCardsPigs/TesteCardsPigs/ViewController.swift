//
//  ViewController.swift
//  TesteCardsPigs
//
//  Created by Guilherme Enes on 30/06/19.
//  Copyright © 2019 Guilherme Enes. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // codigo para notificação
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (accepted, error) in
            // caso queira tratar do erro
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Teste"
        content.body = "Cuí?"
        
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuiString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuiString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            // caso queira tratar algum erro
        }
    }


}

