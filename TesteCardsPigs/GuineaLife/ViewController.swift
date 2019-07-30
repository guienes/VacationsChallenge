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
        msg.title = "Aiai que soninho"

        msg.body = "Cade minhas comidaa! AAAA cui cuii!"
        
        var manha = DateComponents() //notificacao de comida
        manha.hour = 07 // 6 horas da manhã
        manha.minute = 00 // 0 minutos
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: manha, repeats: false) //repete todos os dias
        
        let uuiString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuiString, content: msg, trigger: trigger)
        
        
        let msg2 = UNMutableNotificationContent()
        msg2.title = "Alôô, alguem ai?"
        msg2.body = "Estou com fome.. cuí"
        
        var almoco = DateComponents()
        almoco.hour = 11
        almoco.minute = 00
        
        let almocotrigger = UNCalendarNotificationTrigger(dateMatching: almoco, repeats: false)
        
        let uuiString2 = UUID().uuidString
        let request2 = UNNotificationRequest(identifier: uuiString2, content: msg2, trigger: almocotrigger)
        
        
        center.add(request2) { (error) in
            // caso queira tratar algum erro
        }     // notificacao do almoço
        
        center.add(request) { (error) in
            // caso queira tratar algum erro
        }     // notificacao da manhã
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

