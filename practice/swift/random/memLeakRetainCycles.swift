/// Who owns the closure?
/// Example 1
/// ViewController has a strong reference to Custom View,
/// onTap has a strong reference to self.
/// onTap is a member of CustomView so a cyclical ref occurs

import UIKit
import Foundation

class CustomView:UIView{ 
    var onTap:(()->Void)?
}

class ViewController:UIViewController{ 
    let customView = CustomView() 
    var buttonClicked = false
    
    func setupCustomView(){
        var timesTapped = 0
        customView.onTap = {
            timesTapped += 1 
            print("button tapped \(timesTapped) times")
            self.buttonClicked = true
        }
    }
}

/// ------------------------------------------------
/// Example 2
/// tableView points to cell
/// cell is a CustomCell so it has the onButtonTap closure
/// That closure references the tableViewController self.
/// that tableViewController references view 
/// which has a reference to the table view

class CustomCell: UITableViewCell {  
    @IBOutlet weak var customButton: UIButton!
    var onButtonTap:(()->Void)?
        
    @IBAction func buttonTap(){
        onButtonTap?()
    }
}

class TableViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.onButtonTap = {
            self.navigationController?.pushViewController(NewViewController(), animated: true)
        }
    }
}

/// Example 3
/// GCD - no memory leak
/// When the closure is executed it will drop its reference to self and 
/// since self doesn’t reference the closure, there’s no cycle.
override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        self.navigationController?.pushViewController(NewViewController())
    }
}

/// Example 4
/// rxSwift
/// searchBar is owned by self when it’s added to the view hierarchy, 
/// and the closure references self
class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        searchBar.rx.text.throttle(0.2, scheduler: MainScheduler.instance).subscribe(onNext: {(searchText) in
            self.label.text = "new value: \(searchText)"
        }).addDisposableTo(bag)
    }
}