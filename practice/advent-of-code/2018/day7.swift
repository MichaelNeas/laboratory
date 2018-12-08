import Foundation
let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/data/day7.txt"
struct Node {
    var value: String
    var children: [String]
}

do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let ordering = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: " ") }
    .map { Node(value: $0[1], children: [$0[7]]) }
    print(ordering)
    // we gotta build a treeeeee
}
catch {
    print("Error reading text. \(error)")
}
