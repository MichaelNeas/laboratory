/// There is a snake in an n x n matrix grid and can move in four possible directions. Each cell in the grid is identified by the position: grid[i][j] = (i * n) + j.
/// The snake starts at cell 0 and follows a sequence of commands.
/// You are given an integer n representing the size of the grid and an array of strings commands where each command[i] is either "UP", "RIGHT", "DOWN", and "LEFT". It's guaranteed that the snake will remain within the grid boundaries throughout its movement.
/// Return the position of the final cell where the snake ends up after executing commands.
class Solution {
    enum Command: String {
        case UP
        case RIGHT 
        case DOWN
        case LEFT
    }

    func finalPositionOfSnake(_ n: Int, _ commands: [String]) -> Int {
        commands
        .compactMap(Command.init(rawValue:))
        .reduce(0, { acc, curr in
            switch curr {
                case .UP: return acc - n
                case .RIGHT: return acc + 1
                case .LEFT: return acc - 1
                case .DOWN: return acc + n
            }
        })
    }
}