//
//  ViewController.swift
//  GuessThatFlag
//
//  Created by Michael Neas on 8/27/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flagButtonOne: UIButton!
    @IBOutlet weak var flagButtonTwo: UIButton!
    @IBOutlet weak var flagButtonThree: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "russia", "poland", "spain", "uk", "us", "france", "germany", "ireland", "italy", "monaco", "nigeria"]
        
        // CALayer is below all views
        // border width is an appearance option
        // CALayer is below UIButton so it doesn't know what a UIButton is
        // CALayer has Core Graphics Color though
        [flagButtonOne, flagButtonTwo, flagButtonThree].forEach { button in
            button?.layer.borderWidth = 1
            button?.layer.borderColor = UIColor.lightGray.cgColor
        }
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction? = nil) {
        // setImage assigns UIImage to button
        // for: says which state of the button should be change, UIControlState
        // in swift this is a struct with static variable, objc was an enum
        countries.shuffle()
        // 0 or 2 inclusive
        correctAnswer = Int.random(in: 0...2)
        flagButtonOne.setImage(UIImage(named: countries[0]), for: .normal)
        flagButtonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        flagButtonThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "(\(score)) \(countries[correctAnswer].uppercased())"
    }
    
    func restartGame(action: UIAlertAction? = nil) {
        score = 0
        askQuestion()
    }
    
    // IBAction - storyboard actions trigger code
    @IBAction func flagButtonAction(_ sender: UIButton) {
        var title: String
    
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
        } else {
            score -= 1
            title = "Wrong: That's \(countries[sender.tag])"
        }
        
        if score == 10 {
            let alertController = UIAlertController(title: title, message: "Congrats you have a score of \(score)!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Restart", style: .destructive, handler: restartGame))
        
            present(alertController, animated: true)
        } else {
            // .alert perferred will put alert in front of screen, actionsheet slides up from bottom
            // action sheet for choosing between set of options
            let alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(alertController, animated: true)
        }
    }
}

