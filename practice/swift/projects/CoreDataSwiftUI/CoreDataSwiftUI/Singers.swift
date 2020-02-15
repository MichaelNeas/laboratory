//
//  Singers.swift
//  CoreDataSwiftUI
//
//  Created by Michael Neas on 2/14/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import SwiftUI
import CoreData

struct Singers: View {
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = "K"
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "last", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirst) \(singer.wrappedLast)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.first = "Taylor"
                taylor.last = "Swift"
                
                let beyonce = Singer(context: self.moc)
                beyonce.first = "Beyonce"
                beyonce.last = "Knolls"
                
                try? self.moc.save()
            }
            
            Button("Show K") {
                self.lastNameFilter = "K"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct Singers_Previews: PreviewProvider {
    static var previews: some View {
        Singers()
    }
}
