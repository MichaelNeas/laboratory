import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2018/data/day1.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let totalFrequency = fileContent.components(separatedBy: .newlines)
    .compactMap { Int($0) }
    .reduce(0, { x, y in
        x + y
    })
    print(totalFrequency)

    var freqCache:[Int: Bool] = [:]
    let firstDuplicatedFrequency = fileContent.components(separatedBy: .newlines).compactMap { Int($0) }
    var sum = 0
    var stop = false 
    while !stop {
        for freq in firstDuplicatedFrequency {
            sum += freq
            if freqCache[sum] == true {
                stop = true
                print(sum)
                break
            }else{
                freqCache[sum] = true
            }
        }
    }
    
}
catch {
    print("Error reading text. \(error)")
}