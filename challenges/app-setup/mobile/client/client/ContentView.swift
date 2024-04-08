//
//  ContentView.swift
//  client
//
//  Created by Michael Neas on 4/7/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ItemViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Add Item")) {
                        TextField("Name", text: $viewModel.itemName)
                        TextField("Description", text: $viewModel.itemDescription)
                    }
                    
                    Button("Submit") {
                        viewModel.postItem()
                    }
                }
                
                if viewModel.items.isEmpty {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    List(viewModel.items) { item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            if let desc = item.description {
                                Text(desc)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Form Input")
            .onAppear {
                viewModel.fetchItems()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
