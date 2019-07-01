//
//  Porco+CoreDataProperties.swift
//  TesteCardsPigs
//
//  Created by Guilherme Enes on 01/07/19.
//  Copyright © 2019 Guilherme Enes. All rights reserved.
//
//

import Foundation
import CoreData


extension Porco {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Porco> {
        return NSFetchRequest<Porco>(entityName: "Porco")
    }

    @NSManaged public var caminhoImagem: String?
    @NSManaged public var nome: String?
    @NSManaged public var peso: Float
    @NSManaged public var idade: Int16

}
