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

        var answer = ""
  
        while stack.isEmpty == false {
            answer += stack.removeLast()
        }
        print(answer)
    } 

    func workOn(_ work: [String]) {

    }

    mutating func bruteWorkforce(){
        var answer = ""
        var time = 0
        var workers = 5
        var processableList = Set<String>()
        while nodes.count > 0 || processableList.count > 0 {
            if processableList.count < 1 { 
                for kvpair in nodes {
                    for val in kvpair.value {
                        if nodes[val] == nil {
                            processableList.insert(val)
                        }
                    }
                }
            }
            let sortedBestFromPList = processableList.sorted { $0 < $1 }
            var bestFromPList = ""
            for best in sortedBestFromPList {
                if nodes[best] == nil {
                    bestFromPList = best
                    break
                }
            }
            answer += bestFromPList
            workOn(sortedBestFromPList)
            for node in nodes {
                let filtered = node.value.filter { $0 != bestFromPList }
                if filtered.count == 0 {
                    processableList.insert(node.key)
                    nodes[node.key] = nil
                } else {
                    nodes[node.key] = filtered
                }
            }
            processableList.remove(bestFromPList)
        }
        print(time)
    }

    mutating func brute(){
        var answer = ""
        var processableList = Set<String>()
        while nodes.count > 0 || processableList.count > 0 {
            if processableList.count < 1 { 
                for kvpair in nodes {
                    for val in kvpair.value {
                        if nodes[val] == nil {
                            processableList.insert(val)
                        }
                    }
                }
            }
            let sortedBestFromPList = processableList.sorted { $0 < $1 }
            var bestFromPList = ""
            for best in sortedBestFromPList {
                if nodes[best] == nil {
                    bestFromPList = best
                    break
                }
            }
            answer += bestFromPList
            for node in nodes {
                let filtered = node.value.filter { $0 != bestFromPList }
                if filtered.count == 0 {
                    processableList.insert(node.key)
                    nodes[node.key] = nil
                } else {
                    nodes[node.key] = filtered
                }
            }
            processableList.remove(bestFromPList)
        }
        print(answer)
    }

    func details(){
        print(nodes)
    }
}

do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let ordering = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: " ") }
    .map { (Node(value: $0[7]), Node(value: $0[1])) }
    
    var graph = Graph(nodes: [String:[String]]() , verticies: Set<String>())

    for node in ordering {
        graph.insertNode(from: node.0,to: node.1)
    }

    //graph.topologicalSort()
    //graph.brute()
    graph.bruteWorkforce()
    //graph.details()
}
catch {
    print("Error reading text. \(error)")
}
