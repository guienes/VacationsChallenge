//
//  NotificationViewController.swift
//  GuineaLife
//
//  Created by Guilherme Enes on 01/08/19.
//  Copyright © 2019 Guilherme Enes. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class NotificationViewController: UIViewController, UNUserNotificationCenterDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    
    var pickerData: [[String]] = [[String]]()
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData = [["00 ","01 ", "02 ", "03", "04", "05", "06","07", "08", "09", "10", "11", "12","13", "14", "15", "16", "17","18", "19", "20", "21", "22", "23", "24"],["00","01", "02", "03", "04", "05", "06","07", "08", "09", "10", "11", "12","13", "14", "15", "16", "17","18", "19", "20", "21", "22", "23", "24","25","26", "27", "28", "29", "30", "31","32", "33", "34", "35", "36", "37","38", "39", "40", "41", "42","43", "44", "45", "46", "47", "48", "49","50","51","52","53","54","55","56","57","58","59"]]
    
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    
    
    
   
    
    
    
    
    
    func notificacaoPush(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (accepted, error) in
            // caso queira tratar do erro
        }
        
        let msg = UNMutableNotificationContent()
        msg.title = "teste!"
        
        msg.body = "Cade minhas comidaa! AAAA cui cuii!"
        
        var manha = DateComponents() //notificacao de comida
        manha.hour = 06 // 6 horas da manhã
        manha.minute = 00 // 0 minutos
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: manha, repeats: false) //repete todos os dias
        
        let uuiString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuiString, content: msg, trigger: trigger)
        
        center.add(request) { (error) in
            // tratar erro
        }
    }
    
}
