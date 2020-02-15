//
//  Candy+CoreDataProperties.swift
//  CoreDataSwiftUI
//
//  Created by Michael Neas on 2/14/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "unknown candy name"
    }
}
