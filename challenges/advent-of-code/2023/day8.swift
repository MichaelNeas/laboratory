import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day8.txt", relativeTo: currentDirectoryURL)

let start: Character = "A"
let end: Character = "Z"

// part two resolves around cycle management
func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let temp = b
        b = a % b
        a = temp
    }
    return a
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return abs(a * b) / gcd(a, b)
}

func lcmOfArray(_ numbers: [Int]) -> Int {
    guard let firstNumber = numbers.first else { return 0 }
    return numbers.dropFirst().reduce(firstNumber) { lcm($0, $1) }
}

func countSteps(from start: String, graph: [String: (String, String)], directions: [String.Element]) -> Int {
    var curr = start
    var directionIndex = 0
    var steps = 0

    while curr.last! != "Z" {
        if directionIndex >= directions.count {
            directionIndex = 0
        }

        if directions[directionIndex] == "L" {
            curr = graph[curr]!.0 
        } else {
            curr = graph[curr]!.1
        }

        steps += 1
        directionIndex += 1
    }

    return steps
}

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
                            .components(separatedBy: .newlines)

    let directions = Array(fileContent[0])

    let graph = fileContent.dropFirst(2).reduce(into: [String: (String, String)]()) { acc, curr in
        let groups = curr.split { !$0.isLetter }
                            .filter { $0.contains { $0.isLetter } }
                            .map(String.init)

        acc[groups[0]] = (groups[1], groups[2])
    }

    let paths = graph.keys.reduce(into: [String]()) { acc, curr in
        if curr.last! == start {
            acc.append(curr)
        }
    }.map { countSteps(from: $0, graph: graph, directions: directions) }



    print(lcmOfArray(paths))
}
catch {
    print("Error reading text. \(error)")
}
