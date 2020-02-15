//
//  Order.swift
//  CupcakeCorner
//
//  Created by Michael Neas on 2/14/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import Foundation

class Order: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrost, addSp, name, street, city, zip
    }
    static let types = ["Cho", "va", "Str", "Rain"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrost = false
                addSp = false
            }
        }
    }
    
    @Published var extraFrost = false
    @Published var addSp = false
    
    @Published var name = ""
    @Published var street = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        !name.isEmpty && !street.isEmpty && !city.isEmpty && !zip.isEmpty
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        
        if extraFrost {
            cost += Double(quantity)
        }
        
        if addSp {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrost = try container.decode(Bool.self, forKey: .extraFrost)
        addSp = try container.decode(Bool.self, forKey: .addSp)
        name = try container.decode(String.self, forKey: .name)
        street = try container.decode(String.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrost, forKey: .extraFrost)
        try container.encode(addSp, forKey: .addSp)
        try container.encode(name, forKey: .name)
        try container.encode(street, forKey: .street)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
}
