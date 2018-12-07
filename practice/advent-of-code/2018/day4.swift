import Foundation

let location = "/Users/michael.neas/workspace/laboratory/practice/advent-of-code/2018/data/day4.txt"

struct GuardData { 
    var time: Date
    var scaryGuard: String
    var info: String
}

do {
    var activeGuard = ""
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone.current
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let separatorSet = CharacterSet(charactersIn: " []")
    let allLogs = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: separatorSet) }
    .map { data -> GuardData in 
        if data[5].contains("#") {
            activeGuard = data[5]
        }  else {
            activeGuard = ""
        }
        return GuardData( time: formatter.date(from: "\(data[1]) \(data[2])")!, scaryGuard: activeGuard, info: data[4]) 
    }.sorted(by: { $0.time.compare($1.time) == .orderedAscending })

    print(allLogs)
} catch {
    print("Error reading text. \(error)")
}