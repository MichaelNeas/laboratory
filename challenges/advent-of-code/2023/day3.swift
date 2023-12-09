import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day3.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    var grid = fileContent.components(separatedBy: .newlines)
        .compactMap(Array.init)
    // let validSymbols = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: ".")).inverted
    let validSymbols = CharacterSet(charactersIn: "*")

    var sum = 0
    
    for row in 0..<grid.count {
        for col in 0..<grid[row].count {
            if validSymbols.contains(grid[row][col].unicodeScalars.first!) {
                var foundNumbers: [Int] = [Int]()
                // found a symbol, check neighbors
                for i in -1...1 {
                    for j in -1...1 {
                        let newRow = row + i
                        let newCol = col + j

                        // Check if the new indices are within bounds
                        if newRow >= 0 && newRow < grid.count && newCol >= 0 && newCol < grid[row].count {
                            if Int(String(grid[newRow][newCol])) != nil {
                                
                                var foundNumber = String(grid[newRow][newCol])
                                grid[newRow][newCol] = "."
                                // seach left and right of the string until we hit a period
                                var left = newCol - 1
                                var right = newCol + 1
                                while left >= 0 && Int(String(grid[newRow][left])) != nil {
                                    foundNumber = String(grid[newRow][left]) + foundNumber 
                                    grid[newRow][left] = "."
                                    left -= 1
                                }

                                while right < grid[row].count && Int(String(grid[newRow][right])) != nil {
                                    foundNumber = foundNumber + String(grid[newRow][right])
                                    grid[newRow][right] = "."
                                    right += 1
                                }
                                // sum += Int(foundNumber)!
                                foundNumbers.append(Int(foundNumber)!)
                            }
                        }
                    }
                }
                // print(foundNumbers)
                if foundNumbers.count == 2 {
                    sum += foundNumbers[0] * foundNumbers[1]
                }
                foundNumbers = []
            }
        }
    }
    print(sum)
    
}
catch {
    print("Error reading text. \(error)")
}
