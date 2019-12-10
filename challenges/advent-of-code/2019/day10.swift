import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2019/data/day10.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let astroidMap = fileContent.components(separatedBy: "\n").compactMap { Array($0) }

    for x in 0..<astroidMap.count {
        for y in 0..<astroidMap[0].count{
            print("\(x),\(y) : \(astroidMap[x][y])")
        }
    }
    print(astroidMap)
    //[.] empty 
    //[#] astroid, X,Y where X is distance from left and Y is from top where 0,0 is top left
    // calculate the angle to all other astroids
}
catch {
    print("Error reading text. \(error)")
}