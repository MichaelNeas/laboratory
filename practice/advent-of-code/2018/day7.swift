import Foundation
let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/data/day7.txt"
struct Node {
    var value: String
}

struct Graph {
    var nodes: [String: [String]]
    var verticies: Int

    mutating func insertNode(from: Node, to: Node){
        if self.nodes[from.value] != nil {
            self.nodes[from.value]?.append(to.value)
        } else {
            self.nodes[from.value] = [to.value]
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
    .map { (Node(value: $0[1]), Node(value: $0[7])) }
    
    var graph = Graph(nodes: [String:[String]]() , verticies: 0)

    
    for node in ordering {
        graph.insertNode(from: node.0,to: node.1)
    }

    graph.details()
}
catch {
    print("Error reading text. \(error)")
}
