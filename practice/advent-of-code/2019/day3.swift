import Foundation

let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2019/data/day3.txt"


struct Coordinate: Hashable, Equatable {
    let x: Int
    let y: Int
    let step: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let directions = fileContent.components(separatedBy: "\n")
    let firstLine = directions[0].components(separatedBy: ",")
    let secondLine = directions[1].components(separatedBy: ",")
    var firstLineSet = Set<Coordinate>()
    var collisionSet = Set<Coordinate>()
    var moveX = 0
    var moveY = 0
    var step = 0
    var checking = false
    var collisionStepSums = Array<Int>()
    
    func check(_ dir: String) {
        var dir = dir
        let direction = dir.removeFirst()
        var amount = Int(dir)!
        while amount > 0 {
            switch direction {
            case "R":
                moveX += 1
            case "U":
                moveY += 1
            case "L":
                moveX -= 1
            case "D":
                moveY -= 1
            default:
                break
            }
            step += 1
            let coord = Coordinate(x: moveX, y: moveY, step: step)
            if checking {
                if firstLineSet.contains(coord) {
                    if let prevCoord = firstLineSet.first(where: { $0 == coord }) {
                        collisionStepSums.append(prevCoord.step + coord.step)
                        collisionSet.insert(coord)
                    }
                }
                
            } else {
                firstLineSet.insert(coord)
            }
            
            amount -= 1
        }
    }
    firstLine.forEach(check)
    moveY = 0
    moveX = 0
    step = 0
    checking = true
    secondLine.forEach(check)
    let firstSolution = collisionSet.reduce(Int.max, { closest, curr in
        let manhattanDistance = abs(curr.x) + abs(curr.y)
        return manhattanDistance < closest ? manhattanDistance : closest
    })
    print(firstSolution)
    collisionStepSums.sort()
    print(collisionStepSums)
    print(collisionStepSums[0])
}
catch {
    print("Error reading text. \(error)")
}

