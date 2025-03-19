//
//  User+CoreDataProperties.swift
//  CoreData example
//
//  Created by Chaitanya Soni on 20/02/25.
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
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var favourites: NSOrderedSet?

}

// MARK: Generated accessors for favourites
extension User {

    @objc(insertObject:inFavouritesAtIndex:)
    @NSManaged public func insertIntoFavourites(_ value: Favourite, at idx: Int)

    @objc(removeObjectFromFavouritesAtIndex:)
    @NSManaged public func removeFromFavourites(at idx: Int)

    @objc(insertFavourites:atIndexes:)
    @NSManaged public func insertIntoFavourites(_ values: [Favourite], at indexes: NSIndexSet)

    @objc(removeFavouritesAtIndexes:)
    @NSManaged public func removeFromFavourites(at indexes: NSIndexSet)

    @objc(replaceObjectInFavouritesAtIndex:withObject:)
    @NSManaged public func replaceFavourites(at idx: Int, with value: Favourite)

    @objc(replaceFavouritesAtIndexes:withFavourites:)
    @NSManaged public func replaceFavourites(at indexes: NSIndexSet, with values: [Favourite])

    @objc(addFavouritesObject:)
    @NSManaged public func addToFavourites(_ value: Favourite)

    @objc(removeFavouritesObject:)
    @NSManaged public func removeFromFavourites(_ value: Favourite)

    @objc(addFavourites:)
    @NSManaged public func addToFavourites(_ values: NSOrderedSet)

    @objc(removeFavourites:)
    @NSManaged public func removeFromFavourites(_ values: NSOrderedSet)

}

extension User : Identifiable {

}
