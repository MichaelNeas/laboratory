//
//  Person.swift
//  NamesToFaces
//
//  Created by Michael Neas on 9/11/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

// universal base class is NSObject, everything comes from NSObject
// NSCoding requires classes
// NSObject is required for NSCoding
// NSCoder is responsible for encoding and decoding
// required means the initializer is required to be called on instatiation
// final does not allow subclassing
class Person: NSObject, Codable /*NSCoding*/ {
    var name: String
    var image: String
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    /* NSCoding
    required init?(coder aDecoder: NSCoder) {
        // reads out of disc
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        // writes to disc
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }
    */
}
