//
//  WikiResult.swift
//  BucketList
//
//  Created by Michael Neas on 2/17/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable, CustomStringConvertible {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    static func < (lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
    
    var description: String {
        terms?["description"]?.first ?? "No further info"
    }
}
