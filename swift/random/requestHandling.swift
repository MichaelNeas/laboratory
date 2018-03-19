//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.textColor = .black
        
        if let json = fetchJSON(from: "http://date.jsontest.com/") {
            let dateString = json["date"] as? String
            label.text = dateString
            print(dateString!)
        }
        view.addSubview(label)
        self.view = view
    }
    
    private func fetchJSON(from urlString: String) -> [String:Any]? {
        guard let url = URL(string: urlString),
            let jsonData = try? Data(contentsOf: url),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any] else {
                print("Json serialization no bueno")
                return nil
        }
        return json
    }
    

}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
