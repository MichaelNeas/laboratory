import Foundation

let location = "/Users/michael.neas/workspace/laboratory/practice/advent-of-code/2018/data/day4.txt"


do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let separatorSet = CharacterSet(charactersIn: " #@,:x")
    let allCuts = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: separatorSet)
    
    print(allCuts)
}
catch {
    print("Error reading text. \(error)")
}