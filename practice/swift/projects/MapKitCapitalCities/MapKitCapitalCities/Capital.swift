//
//  Capital.swift
//  MapKitCapitalCities
//
//  Created by Michael Neas on 10/12/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import UIKit
import MapKit

// map annotations can't use structs and must inherit from objC objects
// annotaions have title, subtitle and position
class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
