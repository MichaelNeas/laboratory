//
//  Person.swift
//  NamesToFaces
//
//  Created by Michael Neas on 9/11/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

// universal base class is NSObject, everything comes from NSObject
class Person: NSObject {
    var name: String
    var image: String
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
