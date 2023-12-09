import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day1.txt", relativeTo: currentDirectoryURL)

let qualifiers = [
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9"
]

let searchSet = Array(qualifiers.keys) + Array(qualifiers.values)


func process(value: String) -> String {
    var found = [Int: String]()
    for qualifier in searchSet {
        if let range = value.range(of: qualifier) {
            let startIndex = value.distance(from: value.startIndex, to: range.lowerBound)
            found[startIndex] = String(value[range])
        }
    }
    let sortedKeys = found.keys.sorted()
    let firstValidValue = qualifiers[found[sortedKeys.first!]!] ?? found[sortedKeys.first!]!
    let secondValidValue = qualifiers[found[sortedKeys.last!]!] ?? found[sortedKeys.last!]!
    print(sortedKeys)
    print(value)
    print(firstValidValue+secondValidValue)
    return firstValidValue + secondValidValue
}

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let calibrationTotal = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0) }
        .compactMap(process)
        .reduce(into: 0, { acc, curr in
            acc += Int("\(curr.first!)\(curr.last!)")!
        })
    
    print(calibrationTotal)
    
}
catch {
    print("Error reading text. \(error)")
}
