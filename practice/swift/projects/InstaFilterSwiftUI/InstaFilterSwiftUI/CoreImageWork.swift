//
//  CoreImageWork.swift
//  InstaFilterSwiftUI
//
//  Created by Michael Neas on 2/15/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct CoreImageWork: View {
    @State private var image: Image?
        
    var body: some View {
        VStack {
            image?.resizable().scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let input = UIImage(named: "me") else { return }
        let begin = CIImage(image: input)
        let context = CIContext()
        
        //let currentFilter = CIFilter.sepiaTone()
        //currentFilter.inputImage = begin
        //currentFilter.intensity = 1
        
        //let currentFilter = CIFilter.pixellate()
        //currentFilter.inputImage = begin
        //currentFilter.scale = 100
        
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.setValue(begin, forKey: kCIInputImageKey)
//        currentFilter.radius = 100
        
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
        currentFilter.setValue(begin, forKey: kCIInputImageKey)
        currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: input.size.width / 2, y: input.size.height / 2), forKey: kCIInputCenterKey)
        
        guard let output = currentFilter.outputImage else { return }
        if let cgimg = context.createCGImage(output, from: output.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct CoreImageWork_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageWork()
    }
}
