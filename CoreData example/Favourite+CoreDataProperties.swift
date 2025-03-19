//
//  Favourite+CoreDataProperties.swift
//  CoreData example
//
//  Created by Chaitanya Soni on 20/02/25.
//
//

import Foundation
import CoreData


extension Favourite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourite> {
        return NSFetchRequest<Favourite>(entityName: "Favourite")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var movieID: UUID?
    @NSManaged public var name: String?

}

extension Favourite : Identifiable {

}
