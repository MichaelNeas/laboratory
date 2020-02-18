//
//  MkPointAnnotation+ObservableObject.swift
//  BucketList
//
//  Created by Michael Neas on 2/17/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown"
        }
        
        set {
            subtitle = newValue
        }
    }
}
