import Foundation

let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2018/data/day4.txt"

struct GuardData { 
    var time: Date
    var scaryGuard: String
    var info: String
}

var guardDict = [String: [Int:Int]]()

do {
    var activeGuard = ""
    var sleeping = false
    var latestSleepDate = Date()

    let formatter = DateFormatter()
    formatter.timeZone = TimeZone.current
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let separatorSet = CharacterSet(charactersIn: " []")
    _ = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0).components(separatedBy: separatorSet) }
    .map { data -> GuardData in 
        if data[5].contains("#") {
            activeGuard = data[5]
        }  else {
            activeGuard = ""
        }
        return GuardData( time: formatter.date(from: "\(data[1]) \(data[2])")!, scaryGuard: activeGuard, info: data[4]) 
    }.sorted(by: { $0.time.compare($1.time) == .orderedAscending })
    .forEach{ data in 
        if data.scaryGuard.count > 1 {
            activeGuard = data.scaryGuard
        }
        if data.info == "falls" {
            latestSleepDate = data.time
            sleeping = true
        } else {
            if sleeping {
                let components = Calendar.current.dateComponents([.hour, .minute], from: latestSleepDate, to: data.time)
                for inc in 0..<components.minute! {
                    let min = (Calendar.current.component(.minute, from: latestSleepDate) + inc) % 60
                    if let guardValue = guardDict[activeGuard]?[min] {
                        guardDict[activeGuard]?[min] = guardValue + 1 
                    } else {
                        if guardDict[activeGuard] != nil {
                            guardDict[activeGuard]?[min] = 1
                        } else {
                            guardDict[activeGuard] = [min : 1]
                        }
                    }
                }
                sleeping = false
            }
        }
    }
    var dictMax = [String: Int]()
    guardDict.keys.forEach { gard in 
        let mins = guardDict[gard]?.reduce(0, { x, y in
            x + y.value
        })
        dictMax[gard] = mins
    }
    let sol1 = dictMax.sorted { $0.value > $1.value }[0].key
    let sol2 = guardDict[sol1]?.sorted{ $0.value > $1.value }
    print(sol2![0].0 * Int(sol1.replacingOccurrences(of: "#", with: "", options: NSString.CompareOptions.literal, range:nil))!)

    var closerDict = [String: [(Int, Int)]]()
    guardDict.keys.forEach { gard in 
        let mins = guardDict[gard]?.sorted{ $0.value > $1.value }
        closerDict[gard] = mins
    }
    let sol = closerDict.sorted{ $0.value[0].1 > $1.value[0].1 }
    //print(sol)
    print(sol[0].0)
    print(sol[0].1[0].0)
    
} catch {
    print("Error reading text. \(error)")
}