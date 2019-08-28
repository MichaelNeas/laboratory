//
//  WebsiteChooserTableViewController.swift
//  EasyBrowser
//
//  Created by Michael Neas on 8/28/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

class WebsiteChooserTableViewController: UITableViewController {
    var websites = ["michaelneas.com", "google.com"] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        title = "Simple Website Viewer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSite))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let webViewController = storyboard?.instantiateViewController(withIdentifier: "websiteViewer") as? ViewController {
            webViewController.selectedWebsite = websites[indexPath.row]
            webViewController.websites = websites
            navigationController?.pushViewController(webViewController, animated: true)
        }
    }
    
    @objc func addSite() {
        let alertController = UIAlertController(title: "Add new site", message: "", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Site Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] alert in
            guard let textContent = alertController.textFields?[0],
                let site = textContent.text else { return }
            self?.websites.append(site)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
