//
//  ActionViewController.swift
//  Extension
//
//  Created by Michael Neas on 10/12/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import UIKit
import MobileCoreServices

// NSExtensionActivationSupportsWebPageWithMaxCount in info plist only interested in webpages
// NSExtensionJavaScriptPreprocessingFile run Action.js 
class ActionViewController: UIViewController {

    @IBOutlet weak var script: UITextView!
    var pageTitle = ""
    var pageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        // ios is the intermediary that passes data between safari and extension
        // extension context allows us to control interaction with parent app only care about the first app
        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem {
            // first thing shared with us
            if let itemProvider = inputItem.attachments?.first {
                // provide us with that item and perform some task async
                // dictionary tells us what ios provided to us
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) { [weak self] (dict, error) in
                    // NSDictionary works like a swift dictionary but you don't need to know the types
                    guard let itemDictionary = dict as? NSDictionary,
                        // pull out value using built in key
                        let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else { return }
                    self?.pageTitle = javaScriptValues["title"] as? String ?? ""
                    self?.pageURL = javaScriptValues["URL"] as? String ?? ""
                    
                    // don't need weak self because it is already declared weak
                    DispatchQueue.main.async {
                        self?.title = self?.pageTitle
                    }
                }
            }
        }
    }

    @IBAction func done() {
        let item = NSExtensionItem()
        let argument: NSDictionary = ["customJavaScript": script.text]
        let webDictionary: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: argument]
        let customJavaScript = NSItemProvider(item: webDictionary, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJavaScript]
        extensionContext?.completeRequest(returningItems: [item])
    }

}
