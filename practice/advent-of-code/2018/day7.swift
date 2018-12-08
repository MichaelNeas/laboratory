import Foundation
let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/data/day7.txt"
struct Node {
    var value: String
    var children: [Node]
}

struct Tree {
    var nodes: [Node]

    func insertNode(_ node: Node){
        var found = false
        var queue = nodes
        while !found && queue.count > 0 {
            if curr.value == node.value {
                curr.children.append(node)
                found = true
            } else if curr.value == node.children[0].value{
                node.children.append(curr)
                found = true
            } else {
                
            }
        }
        // queue up the nodes in the tree, process them, 
        // if queue is ever empty or we have a found
        // add to the children or slap it on the root nodes
    }

    func print(){
        // print alphabetical traversal
    }
}

do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    var ordering = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: " ") }
    .map { Node(value: $0[1], children: [Node(value: $0[7], children: [])]) }
    print(ordering[0])
    let tree = Tree(nodes: [ordering.removeFirst()])

    for node in ordering {
        tree.insertNode(node)
    }

    //print(ordering)
}
catch {
    print("Error reading text. \(error)")
}
