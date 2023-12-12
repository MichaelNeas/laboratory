import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day10.txt", relativeTo: currentDirectoryURL)

// | is a vertical pipe connecting north and south.
// - is a horizontal pipe connecting east and west.
// L is a 90-degree bend connecting north and east.
// J is a 90-degree bend connecting north and west.
// 7 is a 90-degree bend connecting south and west.
// F is a 90-degree bend connecting south and east.
// . is ground; there is no pipe in this tile.
// S is the starting position of the animal; there is a pipe on this tile, but your sketch doesn't show what shape the pipe has.

enum Direction: Character {
    case north = "N"
    case south = "S"
    case west = "W"
    case east = "E"
}

struct Position: Hashable {
    var x: Int
    var y: Int
}

func isValidPosition(_ position: Position, grid: [[String.Element]]) -> Bool {
    return position.x >= 0 && position.x < grid.count &&
           position.y >= 0 && position.y < grid[0].count
}

func bfs(grid: inout [[String.Element]], start: Position) -> Int? {
    var queue: [(position: Position, path: String)] = []
    var visited: Set<Position> = []

    queue.append((start, ""))

    while !queue.isEmpty {
        let current = queue.removeFirst()
        if grid[current.position.x][current.position.y] == "M" {
            print("Found the connection piece")
            grid.forEach { print(String($0)) }
            return current.path.count
        }

        for direction in [Direction.north, Direction.south, Direction.west, Direction.east] {
            var nextPosition = current.position
            switch direction {
            case .north:
                nextPosition.x -= 1
                guard isValidPosition(nextPosition, grid: grid) && 
                ["|", "7", "F"].contains(grid[nextPosition.x][nextPosition.y]) && 
                ["|", "J", "L", "S"].contains(grid[current.position.x][current.position.y])else { 
                    continue 
                }
            case .south:
                nextPosition.x += 1
                guard isValidPosition(nextPosition, grid: grid) && 
                ["|", "J", "L"].contains(grid[nextPosition.x][nextPosition.y]) && 
                ["|", "F", "7", "S"].contains(grid[current.position.x][current.position.y]) else { 
                    continue 
                }

                print("PASS")
                print("curr: \(current.position), next: \(nextPosition)")
                print("curr: \(grid[current.position.x][current.position.y]), next: \(grid[nextPosition.x][nextPosition.y])")
                print("isvalid \(isValidPosition(nextPosition, grid: grid))")
            case .west:
                nextPosition.y -= 1
                guard isValidPosition(nextPosition, grid: grid) && 
                ["-", "F", "L"].contains(grid[nextPosition.x][nextPosition.y]) && 
                ["-", "J", "7", "S"].contains(grid[current.position.x][current.position.y]) else { 
                    continue 
                }
            case .east:
                nextPosition.y += 1
                guard isValidPosition(nextPosition, grid: grid) && 
                ["-", "J", "7"].contains(grid[nextPosition.x][nextPosition.y]) && 
                ["-", "F", "L", "S"].contains(grid[current.position.x][current.position.y]) else { 
                    continue 
                }
            }

            if grid[current.position.x][current.position.y] != "S" {
                grid[current.position.x][current.position.y] = "M"
            }
            
        
            if !visited.contains(nextPosition) {
                queue.append((nextPosition, current.path + String(direction.rawValue)))
                visited.insert(nextPosition)
            } else {
                print("SEEN")
                grid[nextPosition.x][nextPosition.y] = "V"
                grid.forEach { print(String($0))  }
                return current.path.count + 1
            }
        }
    }

    grid.forEach { print(String($0)) }
    // No path found
    return nil
}


func isValidPosition(_ position: Position, inGrid grid: [[String.Element]]) -> Bool {
    return position.x >= 0 && position.x < grid[0].count &&
           position.y >= 0 && position.y < grid.count
}


func floodFill(_ grid: inout [[String.Element]], from startPoint: Position) {
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

    var stack = [startPoint]
    if ["M","S","V"].contains(grid[startPoint.y][startPoint.x]) {
        return
    }
    while let currentPosition = stack.popLast() {
        grid[currentPosition.y][currentPosition.x] = "M"

        for direction in directions {
            let nextPoint = Position(x: currentPosition.x + direction.0, y: currentPosition.y + direction.1)
            if isValidPosition(nextPoint, inGrid: grid) && !["M","S","V"].contains(grid[nextPoint.y][nextPoint.x]) {
                stack.append(nextPoint)
            }
        }
    }
}

struct Polygon {
    var vertices: [Position]

    func contains(point: Point) -> Bool {
        var windingNumber = 0

        for i in 0..<vertices.count {
            let currentVertex = vertices[i]
            let nextVertex = vertices[(i + 1) % vertices.count]

            if currentVertex.y <= point.y {
                if nextVertex.y > point.y && isLeftOfEdge(point, currentVertex, nextVertex) {
                    windingNumber += 1
                }
            } else {
                if nextVertex.y <= point.y && isLeftOfEdge(point, nextVertex, currentVertex) {
                    windingNumber -= 1
                }
            }
        }

        return windingNumber != 0
    }

    // Helper function to check if a point is left of an edge
    private func isLeftOfEdge(_ point: Position, _ start: Position, _ end: Point) -> Bool {
        return (end.x - start.x) * (point.y - start.y) > (end.y - start.y) * (point.x - start.x)
    }
}

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    var pipeGrid = fileContent
        .components(separatedBy: .newlines)
        .compactMap{ Array($0) }

        
    var startPosition = Position(x: 0, y: 0)
    for i in 0..<pipeGrid.count {
        for j in 0..<pipeGrid[i].count {
            if pipeGrid[i][j] == "S" {
                startPosition = Position(x: i, y: j)
                print("FOUND the start \(startPosition)")
            }
        }
    }

    let visitedCount = bfs(grid: &pipeGrid, start: startPosition)
    
    // print(visitedCount)
    // flood fill from outside doesn't get the inner bits that aren't in the system
    // for i in 0..<pipeGrid[0].count {
    //     floodFill(&pipeGrid, from: Position(x: i, y: 0))
    //     floodFill(&pipeGrid, from: Position(x: i, y: pipeGrid.count - 1))
    // }

    // for i in 0..<pipeGrid.count {
    //     floodFill(&pipeGrid, from: Position(x: 0, y: i))
    //     floodFill(&pipeGrid, from: Position(x: pipeGrid[0].count - 1, y: i))
    // }
    // print("Final")
    pipeGrid.forEach { print(String($0))  }

    var verticies: [Position]
    for i in 0..<pipeGrid.count {
        for j in 0..<pipeGrid[i].count {
            if !["M","S","V"].contains(pipeGrid[i][j]) {
                burrows += 1
            }
        }
    }
    print(burrows)
}
catch {
    print("Error reading text. \(error)")
}
