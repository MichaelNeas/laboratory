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
        let options = [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
        ]
        
        let font = UIFont.systemFont(ofSize: 12)
        let boldFont = UIFont.boldSystemFont(ofSize: 14)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowBlurRadius = 5
        
        // Create URL
        guard let requestUrl = URL(string: "https://google.com") else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary,
                let results = jsonData["results"] as? [NSDictionary],
                let htmlData = (results.first?["creditsHtml"] as? String)?.data(using: .unicode) {
                
                let attributedHtml = try! NSMutableAttributedString(data: htmlData,
                                                                          options: options,
                                                                          documentAttributes: nil)
                
                attributedHtml.beginEditing()
                attributedHtml.enumerateAttribute(NSAttributedString.Key.font, in: NSRange(location:0, length: attributedHtml.length), options: NSAttributedString.EnumerationOptions(rawValue: 0), using: { (value, range, stop) in
                        guard let value = value as? UIFont else { return }
                        //let fontName = value.fontName.lowercased()
                        var destinationFont = font
                        let descriptor = value.fontDescriptor
                        let symTraits = descriptor.symbolicTraits
                        if symTraits.contains(UIFontDescriptor.SymbolicTraits.traitBold) {
                            destinationFont = boldFont
                        }
                        attributedHtml.removeAttribute(NSAttributedString.Key.font, range: range)
                        attributedHtml.addAttribute(.font, value: destinationFont, range: range)
                })
                
                attributedHtml.enumerateAttribute(NSAttributedString.Key.attachment, in: NSRange(location:0, length: attributedHtml.length), options: [], using: { (value, range, stop) in
                    if let value = value as? NSTextAttachment {
                        DispatchQueue.main.async {
                            value.bounds = CGRect(x: 0, y: 0, width: value.bounds.width*0.50, height: value.bounds.height*0.50)
                        }
                    }
                    
                })
                attributedHtml.endEditing()
                
                
                //attributedHtml.addAttributes(attributes, range: NSRange(location:0, length: attributedHtml.length))
                
                DispatchQueue.main.async {
                    self.htmlView.attributedText = attributedHtml
                }
                
            }
            
        }
        task.resume()
        
        
         
    }
}

