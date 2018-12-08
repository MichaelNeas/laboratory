//int distance = Math.abs(x1-x0) + Math.abs(y1-y0);

import Foundation

let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/data/day6.txt"

do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let separatorSet = CharacterSet(charactersIn: ", ")
    let hubs = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: separatorSet) }
    .compactMap { ( Int($0[0])!,Int($0[2])!)  }

    var sandbox = [[Int]]() 
    for i in 0..<400 {
        sandbox.append([Int]())
        for _ in 0..<400{
            sandbox[i].append(-1)
        }
    }

    for i in 0..<400 {
        for j in 0..<400{
            var distanceMap = [(Int, Int)]()
            for (index, hub) in hubs.enumerated() {
                let distance = abs(i-hub.0) + abs(j-hub.1)
                distanceMap.append((index, distance))
            }
            let sortedMap = distanceMap.sorted { $0.1 < $1.1 }        
            if sortedMap[0].1 == sortedMap[1].1 {
                sandbox[i][j] = -1
            } else {
                sandbox[i][j] = sortedMap[0].0
            }   
        }
    }

    var countedMap = [Int:Int]()
    for i in 0..<400 {
        for j in 0..<400{
            countedMap[sandbox[i][j]] = countedMap[sandbox[i][j]] != nil ? countedMap[sandbox[i][j]]! + 1 : 1
        }
    }

    var unusableSet = Set<Int>()
    for i in 0..<400{
        let (a,b,c,d) = (sandbox[i][0], sandbox[0][i], sandbox[i][399],sandbox[399][i])
        unusableSet.insert(a)
        unusableSet.insert(b)
        unusableSet.insert(c)
        unusableSet.insert(d)
    }
    let sortedCountMap = countedMap.sorted { $0.1 > $1.1 }
    for count in sortedCountMap {
        if !unusableSet.contains(count.0) {
            print(count)
        }
    }
}
catch {
    print("Error reading text. \(error)")
}