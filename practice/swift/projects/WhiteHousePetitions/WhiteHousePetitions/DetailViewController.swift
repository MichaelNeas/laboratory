//
//  DetailViewController.swift
//  WhiteHousePetitions
//
//  Created by Michael Neas on 8/28/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailItem = detailItem else { return }
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                font-size: 150%;
                font-family: Georgia, serif;
                color: #444444;
                letter-spacing: 1.25px;
                line-height: 1.5;
                background: #EEEEEE;
                padding: 5px;
                margin: auto 15px;
            }
        </style>
        </head>
        <body>
            \(detailItem.body)
        </body>
        </html>
        """
        // inject our own html!
        webView.loadHTMLString(html, baseURL: nil)
    }

}
