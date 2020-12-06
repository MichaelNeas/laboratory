import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day4.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let passports = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0) }
	var data = [[String:String]]()
	var curr = [String:String]()
	let eyeColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
	enum requiredKeys: String, CaseIterable {
		case byr
		case iyr
		case eyr
		case hgt
		case hcl
		case ecl
		case pid
	}
	for passportLine in passports {
		if passportLine.isEmpty {
			data.append(curr)
			curr = [String:String]()
			continue
		}
		let components = passportLine.components(separatedBy: " ")
		for component in components {
			let keyValue = component.components(separatedBy: ":")
			curr[keyValue[0]] = keyValue[1]
		}
	}
	data.append(curr)

	var count = 0
	data: for passport in data {
		for reqKey in requiredKeys.allCases {
			if passport[reqKey.rawValue] == nil {
				continue data
			} 
			switch reqKey {
				case .byr:
					// four digits; at least 1920 and at most 2002.
					if passport[reqKey.rawValue]!.count != 4 {
						continue data
					}
					if let val = Int(passport[reqKey.rawValue]!) {
						if val < 1920 || val > 2002 {
							continue data
						}
					}
				case .iyr:
				 	// four digits; at least 2010 and at most 2020.
					if passport[reqKey.rawValue]!.count != 4 {
						continue data
					}
					if let val = Int(passport[reqKey.rawValue]!) {
						if val < 2010 || val > 2020 {
							continue data
						}
					}
				case .eyr:
					// four digits; at least 2020 and at most 2030.
					if passport[reqKey.rawValue]!.count != 4 {
						continue data
					}
					if let val = Int(passport[reqKey.rawValue]!) {
						if val < 2020 || val > 2030 {
							continue data
						}
					}
				case .hgt:
					let range = NSRange(location: 0, length: passport[reqKey.rawValue]!.utf16.count)
					let regex = try! NSRegularExpression(pattern: "[0-9]{3}cm")
					let regexIn = try! NSRegularExpression(pattern: "[0-9]{2}in")
					if let cmMatch = regex.firstMatch(in: passport[reqKey.rawValue]!, options: [], range: range)?.range {
						if cmMatch.upperBound == range.upperBound && cmMatch.lowerBound == range.lowerBound {
							// the number must be at least 150 and at most 193.
							if let val = Int(passport[reqKey.rawValue]!.prefix(3)) {
								if (val < 150 || val > 193)  {
									continue data
								}
							} else {
								continue data
							}
						} else {
							continue data
						}
					} else if let inMatch = regexIn.firstMatch(in: passport[reqKey.rawValue]!, options: [], range: range)?.range {
						if inMatch.upperBound == range.upperBound && inMatch.lowerBound == range.lowerBound {
							// the number must be at least 59 and at most 76.
							if let val = Int(passport[reqKey.rawValue]!.prefix(2) ) {
								if (val < 59 || val > 76)  {
									continue data
								}
							} else {
								continue data
							}
						} else {
							continue data
						}
					} else {
						continue data
					}
				case .hcl:
					// a # followed by exactly six characters 0-9 or a-f.
					let range = NSRange(location: 0, length: passport[reqKey.rawValue]!.utf16.count)
					let regex = try! NSRegularExpression(pattern: "#([0-9]|[a-f]){6}")
					if let match = regex.firstMatch(in: passport[reqKey.rawValue]!, options: [], range: range)?.range {
						if range.upperBound != 7 || match.upperBound != range.upperBound || match.lowerBound != range.lowerBound {
							continue data
						}
					} else {
						continue data
					}
				case .ecl:
					// exactly one of: amb blu brn gry grn hzl oth.
					if !eyeColors.contains(passport[reqKey.rawValue]!) {
						continue data
					}
				case .pid:
					//  a nine-digit number, including leading zeroes.
					let range = NSRange(location: 0, length: passport[reqKey.rawValue]!.utf16.count)
					let regex = try! NSRegularExpression(pattern: "[0-9]{9}")
					if let match = regex.firstMatch(in: passport[reqKey.rawValue]!, options: [], range: range)?.range {
						if range.upperBound != 9 || match.upperBound != range.upperBound || match.lowerBound != range.lowerBound {
							continue data
						}
					} else {
						continue data
					}
			}
		}
		count += 1
	}
	print(count)
}
catch {
    print("Error reading text. \(error)")
}
