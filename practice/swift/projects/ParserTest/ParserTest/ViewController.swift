//
//  ViewController.swift
//  ParserTest
//
//  Created by Michael Neas on 4/7/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import UIKit
import Down

class ViewController: UIViewController {
    @IBOutlet weak var mdView: UIView!
    @IBOutlet weak var htmlView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMarkdown()
        addHTML()
    }
    
    func addMarkdown() {
        let mdFile = Bundle.main.path(forResource: "nicetomeetya", ofType: "md")!
        let contents = try! String(contentsOfFile: mdFile)
        let downView = try! DownView(frame: mdView.bounds, markdownString: contents)
        mdView.addSubview(downView)
    }
    
    func addHTML() {
        let htmlFile = Bundle.main.path(forResource: "nicetomeetya", ofType: "html")!
        let contents = try! String(contentsOfFile: htmlFile)
        let htmlData = NSString(string: contents).data(using: String.Encoding.unicode.rawValue)
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
                NSAttributedString.DocumentType.html]
        htmlView.attributedText = try? NSMutableAttributedString(data: htmlData ?? Data(),
                                                                  options: options,
                                                                  documentAttributes: nil)
    }
}

