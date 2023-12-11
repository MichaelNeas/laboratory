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

func floodFill(_ grid: inout [[String.Element]], from startPoint: Position, with color: String.Element) {
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

    var stack = [startPoint]

    while let currentPoint = stack.popLast() {
        grid[currentPoint.x][currentPoint.y] = color

        for direction in directions {
            let nextPoint = Position(x: currentPoint.x + direction.0, y: currentPoint.y + direction.1)

            if isValidPosition(nextPoint, grid: grid) &&
               grid[nextPoint.y][nextPoint.x] != "M" {
                stack.append(nextPoint)
            }
        }
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

    floodFill(&pipeGrid, from: Position(x: 0, y: 0), with: "M")
    pipeGrid.forEach { print(String($0))  }
}
catch {
    print("Error reading text. \(error)")
}
