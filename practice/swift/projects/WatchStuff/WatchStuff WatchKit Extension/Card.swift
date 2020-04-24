//
//  Card.swift
//  WatchStuff WatchKit Extension
//
//  Created by Michael Neas on 4/24/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import Foundation
import SwiftUI

class Card: ObservableObject, CustomStringConvertible, Codable, Equatable, Identifiable, Comparable {
    let id = UUID()
    @Published var question: String
    @Published var answer: String
    @Published var link: URL
    @Published var favorite: Bool = false
    var sdks: [String]
    
    enum CodingKeys: CodingKey {
        case question, answer, link, favorite, sdks
    }
    
    init(question: String, answer: String, link: URL, sdks: [String] = []) {
        self.question = question
        self.answer = answer
        self.link = link
        self.sdks = sdks
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        question = try container.decode(String.self, forKey: .question)
        answer = try container.decode(String.self, forKey: .answer)
        link = try container.decode(URL.self, forKey: .link)
        favorite = try container.decodeIfPresent(Bool.self, forKey: .favorite) ?? false
        sdks = try container.decodeIfPresent([String].self, forKey: .sdks) ?? []
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(question, forKey: .question)
        try container.encode(answer, forKey: .answer)
        try container.encode(link, forKey: .link)
        try container.encode(favorite, forKey: .favorite)
        try container.encode(sdks, forKey: .sdks)
    }
    
    var description: String {
        "\(id): \(question) - \(answer)"
    }
    
    var sdkDescription: String {
        sdks.joined(separator: " ")
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        lhs.question < rhs.question
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
    
    static let tutorial = Card(question: "Tap for more info, swipe to remove", answer: "Each card has a description, link, and an ability to favorite!", link: URL(string: "mikeneas.com")!)
    static let test: Card = Card(question: "Test", answer: "test answer", link: URL(string: "mikeneas.com")!)
    static var blank: Card {
        Card(question: "New Card", answer: "", link: URL(string: "mikeneas.com")!)
    }
}
