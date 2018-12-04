import Foundation

let location = "/Users/michael.neas/workspace/laboratory/practice/advent-of-code/2018/data/day3.txt"
do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let separatorSet = CharacterSet(charactersIn: " #@,:x")
    let allCuts = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: separatorSet)
    .compactMap { Int($0) } }
    
    var cutMap:[String:Int] = [String : Int]()
    for cut in allCuts {
        for i in cut[1]..<cut[1]+cut[3]{
            for j in cut[2]..<cut[2]+cut[4]{
                 cutMap["\(i),\(j)"] = cutMap["\(i),\(j)"] == nil ? 1 : cutMap["\(i),\(j)"]! + 1
            }
        }
    }
    let sol = cutMap.filter { $0.value > 1 }.count
    print(sol)
}
catch {
    print("Error reading text. \(error)")
}