import Foundation


let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2019/data/day6.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let orbDict = fileContent
        .components(separatedBy: "\n")
        .compactMap { $0.components(separatedBy: ")") }
        .map { (value: $0[0], child: $0[1]) }
        .reduce(into: [String: [String]](), { dict, orb in
            if dict[orb.value] != nil {
                dict[orb.value]!.append(orb.child)
            } else {
                dict[orb.value] = [orb.child]
            }
        })

    var level = 1
    var sum = 1
    
    var searchpaths = orbDict["COM"]!
    
    while searchpaths.count > 0 {
        let nextLevels = searchpaths.compactMap { orbDict[$0] }.flatMap { $0 }
        searchpaths = nextLevels
        level += 1
        sum += nextLevels.count * level
    }
    
    print(level)
    print(sum)

    var start = orbDict["COM"]!
    
    func find(val: String, from orbs: [String], history: [String] = ["COM"]) -> [String]? {
        var history = history

        if orbs.contains(val) {
            history.append(val)
            return history
        }

        for orb in orbs {
            var branchedHistory = history
            branchedHistory.append(orb)
            if let path = find(val: val, from: orbDict[orb] ?? [], history: branchedHistory) {
                return path
            }
        }

        return nil
    }
    
    guard let pathToYou = find(val: "YOU", from: start) else { fatalError("No Path") }
    guard let pathToSanta = find(val: "SAN", from: start) else { fatalError("No Path") }
    let setPathToYou = Set(pathToYou)
    let setPathToSanta = Set(pathToSanta)
    let path = setPathToYou.symmetricDifference(setPathToSanta)
    print(path.count - 2)
} catch {
    print("Error reading text. \(error)")
}
