//
//  RegisterPig.swift
//  TesteCardsPigs
//
//  Created by Guilherme Enes on 03/07/19.
//  Copyright © 2019 Guilherme Enes. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RegisterPig: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNome.delegate = self
        tfIdade.delegate = self
        tfPeso.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        //or
        //self.view.endEditing(true)
        return true
    
    }
    
    @IBAction func DoneRegister(_ sender: Any) {
        let porco = NSEntityDescription.insertNewObject(forEntityName: "Porco", into: context) as! Porco
        
        porco.nome = self.tfNome.text
        
        if let texto = self.tfIdade.text{
            porco.idade = Int16(texto) ?? 0
        }
        
        
        if let texto2 = self.tfPeso.text{
            porco.peso = Float(texto2) ?? 0
        }
        
        
        do{
            try context.save()
        } catch {
            fatalError("Não foi possivel cadastrar o porquinho")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
