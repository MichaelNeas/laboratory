import Foundation

extension String {
    func charAt(_ at: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: at)
        return self[charIndex]
    }
}

func pullOutDifference(between a: String, and b: String) -> String{
    var solution = ""
    for var letter in 0..<a.count{
        if a.charAt(letter) == b.charAt(letter) {
            solution += String(a.charAt(letter))
        }
    }
    return solution
}

func compareLetterDiff(between a: String, and b: String) -> Bool{
    var offByOne = false
    for var letter in 0..<a.count{
        if a.charAt(letter) != b.charAt(letter) {
            if offByOne {
                return false
            }
            offByOne = true
        }
    }
    return offByOne
}

let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/data/day2.txt"
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

    // part 2
    let stringChecksums = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0) }
    for var x in 0..<stringChecksums.count {
        for var y in x..<stringChecksums.count {
            if compareLetterDiff(between: stringChecksums[x], and: stringChecksums[y]) {
                print(pullOutDifference(between: stringChecksums[x], and: stringChecksums[y]))
            }
        }
    }
}
catch {
    print("Error reading text. \(error)")
}

