import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day6.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
                                        .components(separatedBy: .newlines)

    let time = Int(fileContent[0]
    .components(separatedBy: CharacterSet.whitespaces)
    .dropFirst()
    .reduce(into: String(), { $0 += $1 }))!


    let distance = Int(fileContent[1]
    .components(separatedBy: CharacterSet.whitespaces)
    .dropFirst()
    .reduce(into: String(), { $0 += $1 }))!

    var winners = 0

    for interval in 0..<time {
        if (time - interval) * interval > distance {
            winners += 1
        }
    }

    print(winners) 
    
}
catch {
    print("Error reading text. \(error)")
}
