import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day4.txt", relativeTo: currentDirectoryURL)

var cardDict = [Int: Int]()

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let cardTotal = fileContent.components(separatedBy: .newlines)

    // populate the dict
    for i in 1...cardTotal.count {
        cardDict[i] = 1
    }


    cardTotal.enumerated()
        .forEach { offset, line in
            let separatedCard = line.components(separatedBy: CharacterSet(charactersIn: ":|"))
            
            let winningNumbers = Set(separatedCard[1]
            .components(separatedBy: CharacterSet(charactersIn: " ")).compactMap(Int.init))

            let givenNumbers = Set(separatedCard[2]
            .components(separatedBy: CharacterSet(charactersIn: " ")).compactMap(Int.init))

            let winsForThisRow = winningNumbers.intersection(givenNumbers).count
            
            // 1 -> 5 (3 wins)
            // 2 += 5
            // 3 += 5
            // 4 += 5
            if let previousWins = cardDict[offset + 1], winsForThisRow > 0 {
                for i in 1...winsForThisRow {
                    if let existingCard = cardDict[offset + 1 + i] {
                        cardDict[offset + 1 + i] = existingCard + previousWins
                    }
                }
            }

            
            

            // part 1
            // var sum = 0

            // guard wins > 0 else { return 0 }
            // for i in 1..<wins+1 {
            //     if i == 1 {
            //         sum = 1
            //     } else {
            //         sum *= 2
            //     }
            // }

            // return sum
        }
    
    print(cardDict.values.reduce(0, +))
    
}
catch {
    print("Error reading text. \(error)")
}