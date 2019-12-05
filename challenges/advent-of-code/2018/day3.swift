import Foundation

func checkUntouchedCuts(_ processed: [String:Int], _ all: [[Int]]) -> [Int]{
    for cut in all {
        var intersection = false
        for i in cut[1]..<cut[1]+cut[3]{
            for j in cut[2]..<cut[2]+cut[4]{
                if processed["\(i),\(j)"] == nil || processed["\(i),\(j)"] == 1 {
                   
                } else {
                    intersection = true
                }
            }
        }
        if !intersection {
            return cut
        }
    }
    return [1,2,3,4]
}

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2018/data/day3.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let separatorSet = CharacterSet(charactersIn: " #@,:x")
    let allCuts = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: separatorSet)
    .compactMap { Int($0) } }
    
    var cutMap:[String:Int] = [String : Int]()
    for cut in allCuts {
        var intersection = false
        for i in cut[1]..<cut[1]+cut[3]{
            for j in cut[2]..<cut[2]+cut[4]{
                if cutMap["\(i),\(j)"] == nil {
                   cutMap["\(i),\(j)"] = 1 
                } else {
                    cutMap["\(i),\(j)"] = cutMap["\(i),\(j)"]! + 1
                }
            }
        }
    }
    print(checkUntouchedCuts(cutMap, allCuts))
    let sol = cutMap.filter { $0.value > 1 }.count
    print(sol)
}
catch {
    print("Error reading text. \(error)")
}