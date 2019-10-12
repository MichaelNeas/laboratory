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
    var scripts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let savedScripts = defaults.object(forKey: "scripts") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                scripts = try jsonDecoder.decode([String].self, from: savedScripts)
            } catch {
                print("Failed to load scripts")
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(prewrittenScripts))
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
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
    
    // Notification: name and user info dictionary
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        // size of keyboard
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        // rotated screen space
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        if notification.name == UIResponder.keyboardWillHideNotification {
            script.contentSize = .zero
        } else {
            // use the keyboardview height and remove the safe area inset
            script.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        // map the scroll to the inset of the textview
        script.scrollIndicatorInsets = script.contentInset
        
        let selectedRange = script.selectedRange
        script.scrollRangeToVisible(selectedRange)
    }
    
    @objc func prewrittenScripts() {
        let ac = UIAlertController(title: "Scripts", message: "Select from our prewritten scripts", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Alert", style: .default) { [weak self] _ in
            self?.script.text = "alert(\"hi\")"
        })
        ac.addAction(UIAlertAction(title: "Alert2", style: .default) { [weak self] _ in
            self?.script.text = "alert(\"bye\")"
        })
        ac.addAction(UIAlertAction(title: "Saved Scripts", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "toSavedScripts", sender: nil)
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(ac, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SavedScriptsTableViewController {
            vc.scripts = scripts
            vc.scriptSelected = { [weak self] script in
                self?.script.text = script
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
        
        if !scripts.contains(script.text) {
            scripts.append(script.text)
            let jsonEncoder = JSONEncoder()
            if let savedData = try? jsonEncoder.encode(scripts) {
                let defaults = UserDefaults.standard
                defaults.set(savedData, forKey: "scripts")
            } else {
                print("Failed to save scripts.")
            }
        }
    }

}
