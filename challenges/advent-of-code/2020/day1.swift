import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day1.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let fuelInts = fileContent.components(separatedBy: .newlines)
        .compactMap { Int($0) }
    
    for i in 0..<fuelInts.count {
        for j in i+1..<fuelInts.count {
            for k in j+1..<fuelInts.count {
                if fuelInts[i] + fuelInts[j] + fuelInts[k] == 2020 {
                    print(fuelInts[i] * fuelInts[j] * fuelInts[k])
                }
            }
        }
    }
    
    //print(totalFuel)
    
}
catch {
    print("Error reading text. \(error)")
}
