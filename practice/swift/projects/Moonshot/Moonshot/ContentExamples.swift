//
//  ContentExamples.swift
//  Moonshot
//
//  Created by Michael Neas on 11/24/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import SwiftUI

struct ContentExamples: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("wideimage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
            
        }
        // crazy nav with detail
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink(destination: Text("Detail \(row)")) {
//                    Text("Hello \(row)")
//                }
//            }
//            .navigationBarTitle(Text("SwiftUI"))
//        }
    }
}

struct ContentExamples_Previews: PreviewProvider {
    static var previews: some View {
        ContentExamples()
    }
}
