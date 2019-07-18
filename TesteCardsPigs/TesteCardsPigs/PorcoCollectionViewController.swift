//
//  PorcoCollectionViewController.swift
//  TesteCardsPigs
//
//  Created by Guilherme Enes on 01/07/19.
//  Copyright © 2019 Guilherme Enes. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PorcoCollectionViewController: UICollectionViewController{

    @IBOutlet var teste21: UICollectionView!
    
    var porcos: [Porco] = [] // array de database
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        teste21.layer.cornerRadius = 20
        
        do{
            porcos = try context.fetch(Porco.fetchRequest())
        } catch {
            fatalError("Não foi possivel recuperar os dados.")
        }
        
        collectionView.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return porcos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "porcoCell", for: indexPath) as? PorcoCollectionViewCell{
            cell.lblName.text = porcos[indexPath.row].nome
            cell.lblPeso.text = "Peso: \(porcos[indexPath.row].peso)" //converte para string (\)
            cell.lblIdade.text = "Idade: \(porcos[indexPath.row].idade)"
            
            return cell
        }
        
    
        
        
        
        
        
        return UICollectionViewCell()
        
        
        
    }
    
    
    
    
}
