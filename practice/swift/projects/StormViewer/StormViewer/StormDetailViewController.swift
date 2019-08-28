//
//  StormDetailViewController.swift
//  StormViewer
//
//  Created by Michael Neas on 8/27/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

class StormDetailViewController: UIViewController {
    // implicitly unwrapped optional, iboutlets should always be available on load
    @IBOutlet weak var stormImage: UIImageView!
    var selectedImage: String?
    var index = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(index) of \(total)"
        // screen configuration just for one place
        navigationItem.largeTitleDisplayMode = .never
        // UIBarButtonItem uses ObjC so we need to mark @objc
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            stormImage.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // please compile in swift but also make visible by barbuttonitem
    @objc func shareTapped() {
        // 0 min, 1.0 max
        guard let jpgImage = stormImage.image?.jpegData(compressionQuality: 0.8),
            let stormText = selectedImage else { return }
        // here's what i want to share, an activity image
        let viewController = UIActivityViewController(activityItems: [jpgImage, stormText], applicationActivities: nil)
        // on ipad this is required
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
    }

}
