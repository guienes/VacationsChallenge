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
        
        var date = DateComponents() //notificacao de comida
        date.hour = 2 // 2 horas da manhã
        date.minute = 46 // 46 minutos
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true) //repete todos os dias
        
        let uuiString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuiString, content: content, trigger: trigger)
        
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

