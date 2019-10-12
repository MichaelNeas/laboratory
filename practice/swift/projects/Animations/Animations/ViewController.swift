//
//  ViewController.swift
//  Animations
//
//  Created by Michael Neas on 10/11/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true
        // Core animation always takes the shortest route to the final state
  //      UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
        // damping, quite bouncy
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation {
            case 0:
                // twice its normal size
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            case 1:
                //back to its original state
                self.imageView.transform = .identity
            case 2:
                // relative to position
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.imageView.transform = .identity
            case 4:
                // rotate 3.14, upside down
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            case 5:
                self.imageView.transform = .identity
            case 6:
                // almost invisible
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = .cyan
            case 7:
                self.imageView.alpha = 1.0
                self.imageView.backgroundColor = .clear
            default:
                break
            }
        }) { finished in
            sender.isHidden = false
        }
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
        
        
    }
    
}

