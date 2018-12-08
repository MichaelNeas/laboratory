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

    for hubIndex in 0..<hubs.count {
        sandbox[hubs[hubIndex].0][hubs[hubIndex].1] = hubIndex
    }

    // bfs EVERYTHING, account for ties by keeping neg 1

    // count the highest seen number

    // go around the edge and dq those numbers

    //solution is at the top



    print(sandbox)
}
catch {
    print("Error reading text. \(error)")
}