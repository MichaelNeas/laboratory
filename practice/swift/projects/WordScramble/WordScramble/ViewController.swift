//
//  ViewController.swift
//  WordScramble
//
//  Created by Michael Neas on 8/28/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(restartGame))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
           let startWords = try? String(contentsOf: startWordsURL) {
            allWords = startWords.components(separatedBy: "\n")
        }
        
        // faster than checking count
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    @objc func promptForAnswer() {
        let alertController = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        // text field for user
        alertController.addTextField()
        
        // weak self and weak ac are inside the closure, so we don't want to capture them strongly
        // capture list, in describes what's coming into the closure, after is the body - what gets run after
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak alertController] _ in
            guard let answer = alertController?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
    
    @objc func startGame() {
        let userDefaults = UserDefaults.standard
        if let currentWord = userDefaults.string(forKey: "currentWord"),
            currentWord.count > 0 {
            title = currentWord
        } else {
            title = allWords.randomElement()
            usedWords.removeAll(keepingCapacity: true)
            userDefaults.set(title!, forKey: "currentWord")
        }
        
        if let entries = userDefaults.array(forKey: "entries") as? [String] {
            usedWords = entries
        }
        
        tableView.reloadData()
    }
    
    @objc func restartGame() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "currentWord")
        userDefaults.removeObject(forKey: "entries")
        usedWords.removeAll(keepingCapacity: true)
        title = allWords.randomElement()
        userDefaults.set(title!, forKey: "currentWord")
        tableView.reloadData()
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        if lowerAnswer.count < 3 {
            showErrorMessage(errorTitle: "Too short", errorMessage: "Your answer should be longer than 2 characters")
            return
        }
        
        if isPossible(word: lowerAnswer){
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    usedWords.insert(answer, at: 0)
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(usedWords, forKey: "entries")
                    return
                } else {
                    showErrorMessage(errorTitle: "Word not recognized", errorMessage: "You can't just make em up")
                }
            } else {
                showErrorMessage(errorTitle: "Word already used", errorMessage: "Be more original")
            }
        } else {
            showErrorMessage(errorTitle: "Word not possible", errorMessage: "You cannot spell that word from \(title!.lowercased())")
        }
        
        
    }
    
    func showErrorMessage(errorTitle: String, errorMessage: String) {
        let alertController = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.compactMap { $0.lowercased() }.contains(word) && word != title!.lowercased()
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        // needs objC strings, swift strings store strings differently, where backwards compatability doesn't have character combos
        let range = NSRange(location: 0, length: word.utf16.count)
        // string to scan, and how much of the word to scan, and the language to check against
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        // NSNotFound is a historic way to sort of represent an optional
        return misspelledRange.location == NSNotFound
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
}

