import Foundation
let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/data/day7.txt"
struct Node {
    var value: String
    var children: [Node]
}

struct Tree {
    var nodes: [Node]

    func insertNode(_ n: Node){
        var node = n
        var found = false
        var queue = nodes
        while !found && queue.count > 0 {
            var curr = queue.removeFirst()
            if curr.value == node.value {
                curr.children.append(node)
                found = true
            } else if curr.value == node.children[0].value {
                _ = node.children.removeFirst()
                node.children.append(curr)
                curr = node
                found = true
            }
            if curr.children.count > 0 {
                for child in curr.children {
                    queue.append(child)
                }
            }
        }
    }

    func details(){
        // print alphabetical traversal
        print(nodes)
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

    //tree.details()
}
catch {
    print("Error reading text. \(error)")
}
