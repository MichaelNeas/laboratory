//
//  ViewController.swift
//  InstaFilter
//
//  Created by Michael Neas on 9/14/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit
// core image applies filters to images
import CoreImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var intensitySlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    var currentImage: UIImage!
    //An evaluation context for rendering image processing results and performing image analysis.
    var context: CIContext!
    //An image processor that produces an image by manipulating one or more input images or by generating new image data.
    var currentFilter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
        // make a core image from a UIImage which allows us to process it
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    @IBAction func changeFilter(_ sender: UIButton) {
        let ac = UIAlertController(title: "Choose Filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let popoverController = ac.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        present(ac, animated: true)
    }
    
    func setFilter(action: UIAlertAction) {
        guard let actionTitle = action.title, currentImage != nil else { return }
        currentFilter = CIFilter(name: actionTitle)
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
    
    @IBAction func save(_ sender: Any) {
        guard let image = imageView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @IBAction func intensityChange(_ sender: Any) {
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        // A key for a scalar value (NSNumber) that specifies an intensity value.
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(intensitySlider.value, forKey: kCIInputIntensityKey)
        }
        
        // A key for a scalar value (NSNumber) that specifies that specifies the distance from the center of an effect.
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(intensitySlider.value * 200, forKey: kCIInputRadiusKey)
        }
        
        // A key for a scalar value (NSNumber) that specifies the amount of the effect.
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(intensitySlider.value * 10, forKey: kCIInputScaleKey)
        }
        
        // A key for a CIVector object that specifies the center of the area, as x and y- coordinates, to be filtered.
        if inputKeys.contains(kCIInputCenterKey) {
            currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2), forKey: kCIInputCenterKey)
        }
    
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgImage)
            imageView.image = processedImage
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save Error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
}

