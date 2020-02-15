//
//  SaveImageExample.swift
//  InstaFilterSwiftUI
//
//  Created by Michael Neas on 2/15/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import SwiftUI

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        // save, object, method to use, any data to be passed back to us (context)
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}

struct SaveImageExample: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var input: UIImage?
    
    var body: some View {
        VStack {
            image?.resizable().scaledToFit()
            Button("select") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$input)
        }
    }
    
    func loadImage() {
        guard let input = input else { return }
        image = Image(uiImage: input)
        
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: input)
    }
}
