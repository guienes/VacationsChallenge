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

class RegisterPig: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    @IBOutlet weak var addPorquinho: UIImageView!
    
    // codigo pra adicionar foto do porquinho da galeria
    let imagePicker = UIImagePickerController()
    
    private let df = DateFormatter()
    
    var caminhofoto = UUID().uuidString
    
    @IBAction func LoadImagePig(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addPorquinho.image = pickedImage
            //caminhofoto = df.string(from: Date()) DISNEY
            FileHelper.saveImage(image: pickedImage, nameWithoutExtension: caminhofoto)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // fim
    
    
    
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
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
    
    // cadastra os dados no CoreData
    @IBAction func DoneRegister(_ sender: Any) {
        let porco = NSEntityDescription.insertNewObject(forEntityName: "Porco", into: context) as! Porco
        
        porco.nome = self.tfNome.text
        
        porco.caminhoImagem = caminhofoto
        
        if let texto = self.tfIdade.text{
            porco.idade = Int16(texto) ?? 0
        }
        
        
        if let texto2 = self.tfPeso.text{
            porco.peso = Float(texto2) ?? 0
        }
        
//        if let imageData =
        
        
        do{
            try context.save()
        } catch {
            fatalError("Não foi possivel cadastrar o porquinho")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

