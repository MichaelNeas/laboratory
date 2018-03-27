// A protocol defines a blueprint of methods, properties, 
// and other requirements that suit a particular task or piece of functionality. 
// The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. 
// Any type that satisfies the requirements of a protocol is said to conform to that protocol.

class aClass: ParentClass, Protocol1, Protocol2 {}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {}
class ViewController: UIViewController {}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
//implement protocol methods ands variables here..
}
