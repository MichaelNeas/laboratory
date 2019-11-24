//
//  ContentView.swift
//  WeSplit
//
//  Created by Michael Neas on 11/23/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import SwiftUI

struct ContentViewExample: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Harmione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(0..<students.count) {
                        Text(self.students[$0])
                    }
                }
                Button("Tap Count: \(tapCount)") {
                    self.tapCount += 1
                }
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
                Section {
                    ForEach(0..<5) { _ in
                        Text("Hello, World!")
                    }
                    
                }
                Section {
                    ForEach(0..<6) { _ in
                        Text("Hello, World!")
                    }
                }
            }
            .navigationBarTitle("SwiftUI", displayMode: .inline)
        }
    }
}
