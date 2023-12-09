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
        var searchStartIndex = value.startIndex
        while let range = value.range(of: qualifier, range: searchStartIndex ..< value.endIndex) {
            let startIndex = value.distance(from: value.startIndex, to: range.lowerBound)
            found[startIndex] = String(value[range])
            searchStartIndex = range.upperBound
        }
    }
    let sortedKeys = found.keys.sorted()
    let firstValidValue = qualifiers[found[sortedKeys.first!]!] ?? found[sortedKeys.first!]!
    let secondValidValue = qualifiers[found[sortedKeys.last!]!] ?? found[sortedKeys.last!]! 
    return firstValidValue + secondValidValue
}

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let calibrationTotal = fileContent.components(separatedBy: .newlines)
        .map(process)
        .reduce(into: 0, { acc, curr in
            acc += Int("\(curr.first!)\(curr.last!)")!
        })
    
    print(calibrationTotal)
    
}
catch {
    print("Error reading text. \(error)")
}
