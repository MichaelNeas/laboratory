//
//  Item.swift
//  client
//
//  Created by Michael Neas on 4/7/24.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String?
}
