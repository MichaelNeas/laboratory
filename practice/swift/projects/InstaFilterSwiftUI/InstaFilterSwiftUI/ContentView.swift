//
//  ContentView.swift
//  InstaFilterSwiftUI
//
//  Created by Michael Neas on 2/15/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingPicker = false
    @State private var showingFilter = false
    @State private var input: UIImage?
    @State private var processedImage: UIImage?
    @State var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        let intensity = Binding<Double> (
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    if image != nil {
                        image?.resizable().scaledToFit()
                    } else {
                        Text("Tap to select pic")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingPicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") {
                        self.showingFilter = true
                    }
                    Spacer()
                    Button("Save") {
                        guard let processedImage = self.processedImage else { return }
                        let imageSaver = ImageSaver()
                        imageSaver.successHandler = {
                            print("Success")
                        }
                        imageSaver.errorHandler = {
                            print("oof \($0.localizedDescription)")
                        }
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingPicker, onDismiss: loadImage) {
                ImagePicker(image: self.$input)
            }
            .actionSheet(isPresented: $showingFilter) {
                ActionSheet(title: Text("Select filter"), buttons: [
                    .default(Text("Crystallize")) {
                        self.setFilter(CIFilter.crystallize())
                    },
                    .default(Text("Edges")) {
                        self.setFilter(CIFilter.edges())
                    },
                    .default(Text("Gaus blur")) {
                        self.setFilter(CIFilter.gaussianBlur())
                    },
                    .default(Text("Pixels")) {
                        self.setFilter(CIFilter.pixellate())
                    },
                    .default(Text("Sepia")) {
                        self.setFilter(CIFilter.sepiaTone())
                    },
                    .default(Text("Unsharp mask")) {
                        self.setFilter(CIFilter.unsharpMask())
                    },
                    .default(Text("Vignette")) {
                        self.setFilter(CIFilter.vignette())
                    }
                ])
            }
        }
    }
    
    func loadImage() {
        guard let input = input else { return }
        let begin = CIImage(image: input)
        currentFilter.setValue(begin, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let output = currentFilter.outputImage else { return }
        if let cgimg = context.createCGImage(output, from: output.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
