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
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(showScore))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSecretScreen))
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
        let defaults = UserDefaults.standard
        highScore = defaults.integer(forKey: "highScore")
        registerLocalNotifications()
    }
    
    func registerLocalNotifications() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                self.scheduleLocal()
                print("Aye")
            } else {
                print("Awe")
            }
        }
    }
    
    // add a notification every day
    func scheduleLocal() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        // what should be shown inside the alert
        let content = UNMutableNotificationContent()
        content.title = "Let's get to memorizing"
        content.body = "With repetition comes memorization, lets hit this every day"
        //type of alert
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        
        for i in 1..<8 {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(86400 * i), repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
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
    
    func increaseHighScore(action: UIAlertAction? = nil) {
        highScore += 1
        askQuestion()
        save()
    }
    
    @objc func showScore(){
        let alertController = UIAlertController(title: "Your Score", message: "\(score)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
    
        present(alertController, animated: true)
    }
    
    @objc func showSecretScreen() {
        if let secretViewController = storyboard?.instantiateViewController(withIdentifier: "codeAutoLayout"){
            navigationController?.pushViewController(secretViewController, animated: true)
        }
    }
    
    // IBAction - storyboard actions trigger code
    @IBAction func flagButtonAction(_ sender: UIButton) {
        var title: String
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
            sender.imageView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        })
    
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
        } else {
            score -= 1
            title = "Wrong: That's \(countries[sender.tag])"
        }
        
        if score > highScore {
            let alertController = UIAlertController(title: title, message: "Congrats you have a new high score of \(score)!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Yay", style: .default, handler: increaseHighScore))
        
            present(alertController, animated: true)
        } else {
            // .alert perferred will put alert in front of screen, actionsheet slides up from bottom
            // action sheet for choosing between set of options
            let alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(alertController, animated: true)
        }
    }
    
    func save() {
        let defaults = UserDefaults.standard
        defaults.set(highScore, forKey: "highScore")
    }
}

