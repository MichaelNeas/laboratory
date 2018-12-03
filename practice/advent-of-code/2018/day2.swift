import Foundation

let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/day2data.txt"
do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let stringChecksum = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0) }
    .reduce((0,0), { x, y in
        var found = (false, false)
        y.reduce(into: [Character:Int](), { charDict, char in
            if let dictValue = charDict[char] { 
                charDict[char] = dictValue+1
            } else {
                charDict[char] = 1
            }
        }).values.forEach { value in 
            if value == 2 {
                found.0 = true
            }
            if value == 3 {
                found.1 = true
            }
        }
        return (x.0 + (found.0 ? 1 : 0), x.1 + (found.1 ? 1 : 0))
    })

    print(stringChecksum.0 * stringChecksum.1)
}
catch {
    print("Error reading text. \(error)")
}