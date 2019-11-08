//
//  ViewController.swift
//  CoreGraphics
//
//  Created by Michael Neas on 11/7/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var currentDrawType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawRectangle()
    }

    @IBAction func redraw(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 6 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
        case 1:
            drawCircle()
        case 2:
            drawCheckerBoard()
        case 3:
            drawRotatedSquares()
        case 4:
            drawLines()
        case 5:
            drawImagesAndText()
        case 6:
            drawEmoji()
        default:
            break
        }
    }
    
    func drawEmoji() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { context in
            let face = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 20.0, dy: 20.0)
            context.cgContext.setFillColor(UIColor.yellow.cgColor)
            context.cgContext.setStrokeColor(UIColor.white.cgColor)
            context.cgContext.setLineWidth(5)
            context.cgContext.addEllipse(in: face)
            context.cgContext.drawPath(using: .fillStroke)
            let eye = CGRect(x: 160, y: 200, width: 30, height: 30)
            context.cgContext.setFillColor(UIColor.brown.cgColor)
            context.cgContext.setLineWidth(0)
            context.cgContext.addEllipse(in: eye)
            context.cgContext.drawPath(using: .fillStroke)
            let eye2 = CGRect(x: 512 - 180, y: 200, width: 30, height: 30)
            context.cgContext.setFillColor(UIColor.brown.cgColor)
            context.cgContext.addEllipse(in: eye2)
            context.cgContext.drawPath(using: .fillStroke)
            let mouth = CGRect(x: 220, y: 300, width: 100, height: 100)
            context.cgContext.setFillColor(UIColor.brown.cgColor)
            context.cgContext.addEllipse(in: mouth)
            context.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image
    }
    
    func drawImagesAndText() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { context in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle
            ]
            
            let string = "Here goes absolutely nothing"
            
            let attributedStr = NSAttributedString(string: string, attributes: attrs)
            // line wrapping more easily with line frag
            attributedStr.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)
            let mouse = UIImage(named: "mouse")
            mouse?.draw(at: CGPoint(x: 300, y: 150))
        }
        imageView.image = image
    }
    
    func drawLines() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { context in
            // draw from center
            context.cgContext.translateBy(x: 256, y: 256)
            var first = true
            var length: CGFloat = 256
            for _ in 0..<256 {
                // rotate 90 degs
                context.cgContext.rotate(by: .pi/2)
                if first {
                    context.cgContext.move(to: CGPoint(x: length, y: 50))
                    first = false
                } else {
                    context.cgContext.addLine(to: CGPoint(x: length, y: 50))
                }
                
                length *= 0.99
            }
            context.cgContext.setStrokeColor(UIColor.black.cgColor)
            context.cgContext.strokePath()
        }
        imageView.image = image
    }
    
    func drawRotatedSquares() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { context in
            context.cgContext.translateBy(x: 256, y: 256)
            let rotations = 16
            let amount = Double.pi / Double(rotations)
            for _ in 0..<rotations {
                // applies to what the context already was
                context.cgContext.rotate(by: CGFloat(amount))
                context.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
            }
            context.cgContext.setStrokeColor(UIColor.black.cgColor)
            // draw all rotations at 1 time
            context.cgContext.strokePath()
        }
        imageView.image = image
    }
    
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { context in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 15.0, dy: 15.0)
            context.cgContext.setFillColor(UIColor.red.cgColor)
            context.cgContext.setStrokeColor(UIColor.black.cgColor)
            context.cgContext.setLineWidth(10)
            context.cgContext.addEllipse(in: rectangle)
            context.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image
    }
    
    func drawCheckerBoard() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { context in
            context.cgContext.setFillColor(UIColor.black.cgColor)
            
            for row in 0..<8 {
                for col in 0..<8 {
                    if (row + col).isMultiple(of: 2) {
                        context.cgContext.fill(CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                }
            }
        }
        imageView.image = image
    }
    
    func drawRectangle() {
        // points not pixels, so scaling handled for us
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        // graphics renderer context for where we draw
        let image = renderer.image { context in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 15.0, dy: 15.0)
            context.cgContext.setFillColor(UIColor.red.cgColor)
            context.cgContext.setStrokeColor(UIColor.black.cgColor)
            // 5 points inside and outside the rectangle
            context.cgContext.setLineWidth(10)
            context.cgContext.addRect(rectangle)
            context.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image
    }
}

