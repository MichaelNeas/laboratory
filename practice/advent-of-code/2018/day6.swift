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

    
    print(hubs)
}
catch {
    print("Error reading text. \(error)")
}