import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day9.txt", relativeTo: currentDirectoryURL)

func differenceHelper(input: [Int]) -> Int {
    if input.allSatisfy({ $0 == 0 }) {
        return 0
    }

    var nextInput = Array(repeating: 0, count: input.count - 1)
    for val in 1..<input.count {
        nextInput[val - 1] = input[val] - input[val - 1]
    }
    return differenceHelper(input: nextInput) + input.last!
}

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let patterns = fileContent
        .components(separatedBy: .newlines)
        .compactMap{ Array($0.components(separatedBy: " ")
                        .compactMap({ Int($0) }).reversed())
        }
        

    let sols = patterns.map { differenceHelper(input: $0) }
    print(sols.reduce(0, +))
    
}
catch {
    print("Error reading text. \(error)")
}
