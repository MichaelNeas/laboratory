import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day8.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let codes = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0).components(separatedBy: " ") }
		.compactMap { ($0[0], Int($0[1])!) }

	var visitedSet = Set<Int>()
	var curr = 0
	var acc = 0

	while !visitedSet.contains(curr) {
		visitedSet.insert(curr)
		switch codes[curr].0 {
			case "nop":
				curr += 1
			case "acc":
				acc += codes[curr].1
				curr += 1
			case "jmp":
				curr += codes[curr].1
			default: 
				print("Not accounted for")
		}
	}
	print(acc)
	
} catch {
	print("ERROR")
}

5