import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day5.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let locations = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0) }
	var idList = [Int]()
	for location in locations {
		var rowA = 0
		var rowB = 127
		var colA = 0
		var colB = 7
		for val in location {
			if val == "B" {
				rowA = Int((rowB + rowA) / 2) + 1
				//print("\(rowA)-\(rowB)")
			} else if val == "F" {
				rowB = Int((rowB + rowA) / 2)
				//print("\(rowA)-\(rowB)")
			} else if val == "R" {
				colA = Int((colB + colA) / 2) + 1
				//print("\(colA)-\(colB)")
			} else {
				colB = Int((colB + colA) / 2)
				//print("\(colA)-\(colB)")
			}
		}
		let num = (rowA * 8) + colA
		// if max < num {
		// 	max = num
		// }
		idList.append(num)
	}
	var prev = -1
	let sortedIDs = idList.sorted()
	for idIndex in 0..<sortedIDs.count - 1 {
		if sortedIDs[idIndex] == prev + 1 && sortedIDs[idIndex] == sortedIDs[idIndex + 1] - 1 {
			//print("SEAT found \(sortedIDs[idIndex])")
			prev = sortedIDs[idIndex]
		} else {
			print("Outcasts \(sortedIDs[idIndex])")
			prev = sortedIDs[idIndex]
		}
	}
} catch {
	print("Error")
}