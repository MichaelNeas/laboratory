import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day10.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let nums = fileContent.components(separatedBy: .newlines)
        .compactMap { Int($0) }
		.sorted()

	var differences = [Int: Int]()
	//var outlet = 0
	for i in 0..<nums.count {
		if i == 0 {
			differences[nums[i+1] - nums[i], default: 0] += 1
		} else if i == nums.count - 1 {
			differences[nums[i] - nums[i-1], default: 0] += 1
		} else {
			differences[nums[i+1] - nums[i], default: 0] += 1
		}
	}
	differences[3]! += 1
	print(differences[1]! * differences[3]!)
} catch {
	print("ERROR")
}