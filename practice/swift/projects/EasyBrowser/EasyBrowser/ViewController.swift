//
//  ViewController.swift
//  EasyBrowser
//
//  Created by Michael Neas on 8/28/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit
import WebKit

// conform to wknavigationDelegate
class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = [String]()
    var selectedWebsite: String = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        // .flexibleSpace, can't be tapped
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        // reloads web view in place
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        progressView = UIProgressView(progressViewStyle: .default)
        // set its layout size to fill content fully
        progressView.sizeToFit()
        // wrap it up to put in toolbar
        let progressButton = UIBarButtonItem(customView: progressView)
        
        // back and forward
        let back = UIBarButtonItem(title: "back", style: .plain, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))
        
        // uiviewcontroller toolbar items on the bottom
        // flexible space automatically takes up as much space as possible
        toolbarItems = [progressButton, spacer, back, forward , refresh]
        navigationController?.isToolbarHidden = false
        
        // Key value observation
        // checks wekwebview actually has the property
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        // ATS will only load secure sites
        let url = URL(string: "https://www." + selectedWebsite)!
        // wkwebview doesn't load from strings, needs url
        webView.load(URLRequest(url: url))
        // allows you to swipe from right or left, as seen in safari browser
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func openTapped() {
        let alertController = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        for site in websites {
            alertController.addAction(UIAlertAction(title: site, style: .default, handler: openPage))
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(alertController, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title,
            let url = URL(string: "https://www.\(actionTitle)") else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    // whether we want navigation to occur or not
    // escaping means it has the potential to escape this method and be used somewhere else
    // acknowledging that the closure might be used somewhere else
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        guard let host = url?.host else {
            decisionHandler(.cancel)
            return
        }
        for website in websites {
            if host.contains(website) {
                decisionHandler(.allow)
                return
            }
        }
        let alertViewController = UIAlertController(title: "Ooops!", message: "Navigating to \(host) is not allowed.", preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        present(alertViewController, animated: true)
        decisionHandler(.cancel)
    }
}
