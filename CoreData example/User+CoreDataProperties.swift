//
//  User+CoreDataProperties.swift
//  CoreData example
//
//  Created by Chaitanya Soni on 16/09/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension User : Identifiable {

}
