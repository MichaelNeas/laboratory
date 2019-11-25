//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Michael Neas on 11/24/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file)")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode([T].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
