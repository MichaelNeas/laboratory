/// On an 8 x 8 chessboard, there is one white rook.  There also may be empty squares, white bishops, and black pawns. 
/// These are given as characters 'R', '.', 'B', and 'p' respectively. Uppercase characters represent white pieces, 
/// and lowercase characters represent black pieces.
/// The rook moves as in the rules of Chess: it chooses one of four cardinal directions 
/// (north, east, west, and south), then moves in that direction until it chooses to stop, 
/// reaches the edge of the board, or captures an opposite colored pawn by moving to the same square it occupies. 
/// Also, rooks cannot move into the same square as other friendly bishops.
/// Return the number of pawns the rook can capture in one move.

class Solution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var rookLocation = (-1, -1)
        rookFinder: for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "R" {
                    rookLocation = (i, j)
                    break rookFinder
                }
            }
        }
        
        var caps = 0
        var loc = rookLocation
        while loc.0 > 0 {
            loc.0 -= 1
            if board[loc.0][loc.1] == "p" { caps += 1; break }
            if board[loc.0][loc.1] == "B" { break }
        }
        
        loc = rookLocation
        while loc.0 < board.count - 1 {
            loc.0 += 1
            if board[loc.0][loc.1] == "p" { caps += 1; break }
            if board[loc.0][loc.1] == "B" { break }
        }
        
        loc = rookLocation
        while loc.1 > 0 {
            loc.1 -= 1
            if board[loc.0][loc.1] == "p" { caps += 1; break }
            if board[loc.0][loc.1] == "B" { break }
        }
        
        loc = rookLocation
        while loc.1 < board.count - 1 {
            loc.1 += 1
            if board[loc.0][loc.1] == "p" { caps += 1; break }
            if board[loc.0][loc.1] == "B" { break }
        }
        
        return caps
    }
}