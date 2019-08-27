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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
