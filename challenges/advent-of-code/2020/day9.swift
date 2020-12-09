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

	let target = nums[curr]
	print(target)

	done: for i in 0..<curr {
		for j in i+1..<curr {
			var sum = nums[j]
			for iterator in i..<j {
				sum += nums[iterator]
			}
			if sum == target {
				print("FOUND")
				var max = 0
				var min = Int.max
				for range in i...j {
					if nums[range] > max {
						max = nums[range]
					}
					if nums[range] < min {
						min = nums[range]
					}
				}
				print(max+min)
				break done
			}
		}
	}
	
} catch {
	print("ERROR")
}