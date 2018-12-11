import Foundation
let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/data/day7.txt"
struct Node {
    var value: String
}

struct Graph {
    var nodes: [String: [String]]
    var verticies: Set<String>


    mutating func insertNode(from: Node, to: Node){
        if self.nodes[from.value] != nil {
            self.nodes[from.value]?.append(to.value)
        } else {
            self.nodes[from.value] = [to.value]
        }
        verticies.insert(from.value)
        verticies.insert(to.value)
    }

    func topologicalSortUtil(_ v: String, _ visited: inout [String: Bool], _ stack: inout [String]) { 
        visited[v] = true;
        for node in nodes[v] ?? [] {
            if visited[node] == false {
                topologicalSortUtil(node, &visited, &stack)
            }
        }
        stack.append(String(v))
    } 

    func topologicalSort() { 
        var stack = [String]()
        var visited = [String: Bool]()

        for node in verticies {
            visited[node] = false; 
        }
        for node in verticies {
            if visited[node] == false {
                topologicalSortUtil(node, &visited, &stack)
            }
        }
  
        while stack.isEmpty == false {
            print("\(stack.removeLast()) "); 
        }
    } 

    func details(){
        // print alphabetical traversal
        print(nodes)
    }
}

do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let ordering = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: " ") }
    .map { (Node(value: $0[1]), Node(value: $0[7])) }
    
    var graph = Graph(nodes: [String:[String]]() , verticies: Set<String>())

    for node in ordering {
        graph.insertNode(from: node.0,to: node.1)
    }

    graph.topologicalSort()

    //graph.details()
}
catch {
    print("Error reading text. \(error)")
}
