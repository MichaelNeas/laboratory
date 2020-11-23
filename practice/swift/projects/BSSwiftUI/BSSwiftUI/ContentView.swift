//
//  ContentView.swift
//  BSSwiftUI
//
//  Created by Michael Neas on 11/23/20.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet: Bool = false
    @State var images: [Image] = []
    var body: some View {
        VStack {
            imageList
            Button(action: { showSheet = true }, label: {
                Text("Show")
            })
        }.fullScreenCover(isPresented: $showSheet, content: {
            BSImagePickerViewRepresentable(images: $images)
        })
    }
    
    private var imageList: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(images.map({ ($0, UUID()) }), id: \.1) { image in
                    image.0//.resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200)
                }
            }
        }
    }
}
