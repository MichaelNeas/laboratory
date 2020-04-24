//
//  HostingController.swift
//  WatchStuff WatchKit Extension
//
//  Created by Michael Neas on 4/24/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<ContentView> {
    override var body: ContentView {
        return ContentView()
    }
}

struct HostingController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
