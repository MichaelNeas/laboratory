//
//  ViewController.swift
//  StormViewer
//
//  Created by Michael Neas on 8/27/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // get the file manager instance
        let fileManager = FileManager.default
        // look at where our app is compiled and all of it's assets, some app bundles, not iOS, don't have app bundles
        let path = Bundle.main.resourcePath!
        // get all the items in the directory, if we cannot read our app bundle there is no reason for the app
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                // picture to load
                pictures.append(item)
            }
        }
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // instantiateViewController creates the view controller in the storyboard, lookup from storyboardID
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "StormDetail") as? StormDetailViewController {
            viewController.selectedImage = pictures[indexPath.row]
            viewController.index = indexPath.row + 1
            viewController.total = pictures.count
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

