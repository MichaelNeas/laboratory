//
//  ItemViewModel.swift
//  client
//
//  Created by Michael Neas on 4/7/24.
//

import Foundation

final class ItemViewModel: ObservableObject {
    @Published var items = [Item]()
    @Published var itemName = ""
    @Published var itemDescription = ""
    
    func fetchItems() {
        Task {
            do {
                let fetchedItems = try await NetworkManager.shared.fetchItems()
                DispatchQueue.main.async {
                    self.items = fetchedItems
                }
            } catch {
                print("Error fetching items: \(error)")
            }
        }
    }
    
    func postItem() {
        let newItem = Item(id: Int.random(in: 0...Int.max), name: itemName, description: itemDescription)
        Task {
            do {
                try await NetworkManager.shared.postItem(item: newItem)
                DispatchQueue.main.async {
                    self.items.append(newItem)
                    self.clearForm()
                }
            } catch {
                print("Error posting item: \(error)")
            }
        }
    }
    
    private func clearForm() {
        itemName = ""
        itemDescription = ""
    }
}
