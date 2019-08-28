//
//  ViewController.swift
//  WhiteHousePetitions
//
//  Created by Michael Neas on 8/28/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showCredits))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterPetitions))
        
        // points to json data online
        let urlString: String
        if navigationController?.tabBarItem.tag == 1 {
            // if breaks, mirror: https://www.hackingwithswift.com/samples/petitions-1.json
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            // if breaks, mirror: https://www.hackingwithswift.com/samples/petitions-2.json
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
        if let url = URL(string: urlString),
            let data = try? Data(contentsOf: url) {
            parseJSON(json: data)
        } else {
            showError()
        }
    }
    
    @objc func filterPetitions() {
        let alertController = UIAlertController(title: "Search", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "search term"
        }
        let filterAction = UIAlertAction(title: "Filter", style: .default) { [weak self, weak alertController] _ in
            guard let textContent = alertController?.textFields?[0],
                let filteredText = textContent.text else { return }
            self?.filter(filteredText)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(filterAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func filter(_ text: String) {
        filteredPetitions = petitions.filter { $0.body.contains(text) || $0.title.contains(text) }
        tableView.reloadData()
    }
    
    @objc func showCredits() {
        let alertController = UIAlertController(title: "Credits", message: "This content is pulled from api.whitehouse.gov", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    func showError() {
        let alertController = UIAlertController(title: "Loading Error", message: "There was an issue loading feed, check connection and try again", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    func parseJSON(json: Data){
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredPetitions[indexPath.row].title
        cell.detailTextLabel?.text = filteredPetitions[indexPath.row].body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
