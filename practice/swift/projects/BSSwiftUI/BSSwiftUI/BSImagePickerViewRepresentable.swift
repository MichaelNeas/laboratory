//
//  BSImagePickerViewRepresentable.swift
//  BSSwiftUI
//
//  Created by Michael Neas on 11/23/20.
//

import SwiftUI
import Photos
import BSImagePicker


public struct BSImagePickerViewRepresentable {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var images: [Image]
    
    private func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

extension BSImagePickerViewRepresentable: UIViewControllerRepresentable {

    public typealias UIViewControllerType = ImagePickerController
    
    public func makeUIViewController(context: Context) -> ImagePickerController {
        let picker = ImagePickerController()
        
        //picker.settings.selection.max = 5
        picker.settings.selection.unselectOnReachingMax = false
        picker.settings.theme.selectionStyle = .numbered
        picker.settings.fetch.assets.supportedMediaTypes = [.image]
        picker.imagePickerDelegate = context.coordinator
        
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: ImagePickerController, context: Context) {
        
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

extension BSImagePickerViewRepresentable {
    public class Coordinator: ImagePickerControllerDelegate {
        private let parent: BSImagePickerViewRepresentable
        
        public init(_ parent: BSImagePickerViewRepresentable) {
            self.parent = parent
        }
        
        public func imagePicker(_ imagePicker: ImagePickerController, didSelectAsset asset: PHAsset) {
            print("Selected: \(asset)")
        }
        
        public func imagePicker(_ imagePicker: ImagePickerController, didDeselectAsset asset: PHAsset) {
            print("Deselected: \(asset)")
        }
        
        public func imagePicker(_ imagePicker: ImagePickerController, didFinishWithAssets assets: [PHAsset]) {
            print("Finished with selections: \(assets)")
            let options = PHImageRequestOptions()
            options.isSynchronous = false
            options.resizeMode = .exact
            assets.forEach { asset in
                PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 1000, height: 1000), contentMode: .aspectFit, options: options) { (image, info) in
                    
                    guard let image = image, let degraded = info?["PHImageResultIsDegradedKey"] as? Int, degraded == 0 else { return }
                    DispatchQueue.main.async {
                        self.parent.images.append(Image(uiImage: image))
                    }
                }
            }
            parent.dismiss()
        }
        
        public func imagePicker(_ imagePicker: ImagePickerController, didCancelWithAssets assets: [PHAsset]) {
            print("Canceled with selections: \(assets)")
            parent.dismiss()
        }
        
        public func imagePicker(_ imagePicker: ImagePickerController, didReachSelectionLimit count: Int) {
            print("Did Reach Selection Limit: \(count)")
        }
    }
}
