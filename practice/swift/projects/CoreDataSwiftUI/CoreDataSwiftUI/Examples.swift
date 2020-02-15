//
//  Examples.swift
//  CoreDataSwiftUI
//
//  Created by Michael Neas on 2/14/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//
import CoreData
import SwiftUI

struct Examples: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe in %@", ["Wacky", "tobacci"])) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
                Button("Add Examples") {
                    let ship = Ship(context: self.moc)
                    ship.name = "booger"
                    ship.universe = "Solar"
                    
                    let aShip = Ship(context: self.moc)
                    aShip.name = "yo"
                    aShip.universe = "Wacky"
                    
                    try? self.moc.save()
                }
            }
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown name")
                Button("Add") {
                    let wizard = Wizard(context: self.moc)
                    wizard.name = "Harry Potter"
                }
                Button("Save") {
                    if self.moc.hasChanges {
                        do {
                            try self.moc.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}

struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        Examples()
    }
}
