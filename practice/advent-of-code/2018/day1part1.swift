import Foundation

let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/day1data.txt"
do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let strings = fileContent.components(separatedBy: .newlines)
    .compactMap { Int($0) }
    .reduce(0, { x, y in
        x + y
    })
    print(strings)
}
catch {
    print("Error reading text. \(error)")
}