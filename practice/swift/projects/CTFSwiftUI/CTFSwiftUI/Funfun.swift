//
//  ContentView.swift
//  CTFSwiftUI
//
//  Created by Michael Neas on 11/24/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import SwiftUI

struct ContentView2: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello"), message: Text("This is some detail"), dismissButton: .default(Text("OK")))
        }
        
//        Button(action: {
//            print("Button was tapped")
//        }) {
//            HStack(spacing: 10) {
//                Image(systemName: "pencil").renderingMode(.original)
//                Text("Edit")
//            }
//        }
    }
}
