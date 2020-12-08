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
	var change = 0

	out: while curr < codes.count {
		while !visitedSet.contains(curr) && curr < codes.count {
			visitedSet.insert(curr)
			switch codes[curr].0 {
				case "nop":
					if curr == change {
						curr += codes[curr].1
					} else {
						curr += 1
					}
				case "acc":
					acc += codes[curr].1
					curr += 1
				case "jmp":
					if curr == change {
						curr += 1	
					} else {
						curr += codes[curr].1
					}
				default: 
					print("Not accounted for")
			}
			
			if curr >= codes.count {
				print(acc)
				break out
			}
		}
		curr = 0
		acc = 0
		visitedSet.removeAll()
		change += 1
		var nextChange = true
		while nextChange {
			
			if codes[change].0 == "acc" {
				change += 1
			} else {
				nextChange = false
			}
		}
	}
	
} catch {
	print("ERROR")
}