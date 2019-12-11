import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2019/data/day10.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let astroids = fileContent.components(separatedBy: "\n").compactMap { Array($0) }

    struct Astroid: CustomDebugStringConvertible {
        let x: Int
        let y: Int
        let visibleAstroids: Int

        var debugDescription: String {
            return "Astroid [\(x), \(y)] => \(visibleAstroids)"
        }
    }

    var foundAstroids = [Astroid]()
    func arcTan(_ x: Int, _ y: Int, _ u: Int, _ v: Int) -> Double {
        return atan2(Double(v-y), Double(u-x)) * 180.0 / Double.pi
    }
    
    func checkFrom(_ x: Int, _ y: Int) -> Int {
        var foundAngles = Set<Double>()
        for u in 0..<astroids[0].count {
            for v in 0..<astroids.count {
                if astroids[v][u] == "#" {
                    if x == 5 && y == 8 {
                        print(arcTan(x, y, u, v))
                    }   
                    foundAngles.insert(arcTan(x, y, u, v))
                }
            }
        }
        return foundAngles.count
    }

    for x in 0..<astroids[0].count {
        for y in 0..<astroids.count {
            if astroids[y][x] == "#" {
                foundAstroids.append(Astroid(x: x, y: y, visibleAstroids: checkFrom(x,y)))
            }
        }
    }
    print(foundAstroids.sorted(by: { $0.visibleAstroids > $1.visibleAstroids }))
}
catch {
    print("Error reading text. \(error)")
}
