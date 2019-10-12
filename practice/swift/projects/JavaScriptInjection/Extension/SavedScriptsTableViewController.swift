//
//  SavedScriptsTableViewController.swift
//  Extension
//
//  Created by Michael Neas on 10/12/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import Foundation
import UIKit

class SavedScriptsTableViewController: UITableViewController {
    var scripts = [String]()
    var scriptSelected: ((String)->())?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scripts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scriptCell", for: indexPath)
        cell.textLabel?.text = scripts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        scriptSelected?(scripts[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
}
