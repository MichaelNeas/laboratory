//
//  Singer+CoreDataProperties.swift
//  CoreDataSwiftUI
//
//  Created by Michael Neas on 2/14/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var first: String?
    @NSManaged public var last: String?
    
    var wrappedFirst: String {
        first ?? "Unknown"
    }
    
    var wrappedLast: String {
        last ?? "Unknown"
    }
}
