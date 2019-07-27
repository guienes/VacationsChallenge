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
        
        let msg = UNMutableNotificationContent()
        msg.title = "Alôô, alguem ai?"
        msg.body = "Estou com fome.. cuí"
        
        var date = DateComponents() //notificacao de comida
        date.hour = 6 // 6 horas da manhã
        date.minute = 00 // 0 minutos
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false) //repete todos os dias
        
        let uuiString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuiString, content: msg, trigger: trigger)
        
        center.add(request) { (error) in
            // caso queira tratar algum erro
        }
    }
    
    // tela Tamanho cercado
    
    @IBAction func voltarTamanho(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // tela forração do cercado
    
    @IBAction func voltarForracao(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


}

