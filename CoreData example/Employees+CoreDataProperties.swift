//
//  Employees+CoreDataProperties.swift
//  CoreData example
//
//  Created by Chaitanya Soni on 08/02/25.
//
//

import Foundation
import CoreData


extension Employees {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employees> {
        return NSFetchRequest<Employees>(entityName: "Employees")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var attribute: URL?
    @NSManaged public var attribute1: NSObject?

}

extension Employees : Identifiable {

}
