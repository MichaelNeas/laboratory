//
//  DetailView.swift
//  Bookworm
//
//  Created by Michael Neas on 2/14/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import CoreData
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    let book: Book
    
    var body: some View {
         VStack {
           Text(self.book.genre?.uppercased() ?? "FANTASY")
               .font(.caption)
               .fontWeight(.black)
               .padding(8)
               .foregroundColor(.white)
               .background(Color.black)
               .clipShape(Capsule())
           Text(self.book.author ?? "Unknown auth")
               .font(.title)
               .foregroundColor(.secondary)
           Text(self.book.review ?? "No Review").padding()
           StarRating(rating: .constant(Int(self.book.rating)))
               .font(.largeTitle)
           
           Spacer()
       }.navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
            .alert(isPresented: $showingDeleteAlert) {
                Alert(title: Text("Delete Book"),
                      message: Text("Are you sure?"),
                      primaryButton: .destructive(Text("Delete")) {
                        self.deleteBook()
                    }, secondaryButton: .cancel())
        }
         .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
         }) {
            Image(systemName: "trash")
         })
    }
    
    func deleteBook() {
        moc.delete(book)
        try? self.moc.save()
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "test book"
        book.author = "test auth"
        book.genre = "fantacy"
        book.rating = 4
        book.review = "nice"
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
