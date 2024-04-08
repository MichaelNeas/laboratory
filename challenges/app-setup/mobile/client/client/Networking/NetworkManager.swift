//
//  NetworkManager.swift
//  client
//
//  Created by Michael Neas on 4/7/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = URL(string: "http://localhost:8080")!
    
    func fetchItems() async throws -> [Item] {
        let url = baseURL.appendingPathComponent("/items")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Item].self, from: data)
    }
    
    func postItem(item: Item) async throws {
        let url = baseURL.appendingPathComponent("/items/add")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(item)
        _ = try await URLSession.shared.data(for: request)
    }
}
