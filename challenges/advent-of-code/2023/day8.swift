import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day8.txt", relativeTo: currentDirectoryURL)

let start = "AAA"
let end = "ZZZ"



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

    var curr = start
    var directionIndex = 0
    var steps = 0

    while curr != end {
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

    print(steps)
}
catch {
    print("Error reading text. \(error)")
}
