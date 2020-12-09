import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day9.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let nums = fileContent.components(separatedBy: .newlines)
        .compactMap { Int($0) }
	
	let previous = 25
	var curr = 25

	out: while curr < nums.count {
		var found = false
		for i in curr-previous..<curr {
			for j in curr-previous+1..<curr {
				if nums[i] + nums[j] == nums[curr] {
					curr += 1
					found = true
					continue out
				}
			}
		}
		if !found {
			break
		}	
	}

	print(nums[curr])
} catch {
	print("ERROR")
}