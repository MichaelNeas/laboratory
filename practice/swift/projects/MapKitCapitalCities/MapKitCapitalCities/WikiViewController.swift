//
//  WikiViewController.swift
//  MapKitCapitalCities
//
//  Created by Michael Neas on 10/12/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController, WKNavigationDelegate {
    var wikiWebView: WKWebView!
    var search: String?
    
    override func loadView() {
        wikiWebView = WKWebView()
        wikiWebView.navigationDelegate = self
        view = wikiWebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://en.wikipedia.org/wiki/\(search!)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: urlString)!
        wikiWebView.load(URLRequest(url: url))
    }
}
