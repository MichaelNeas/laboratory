// Return true if the square is white, and false if the square is black.
// The coordinate will always represent a valid chessboard square. The coordinate will always have the letter first, and the number second.


class Solution {
    func squareIsWhite(_ coordinates: String) -> Bool {
        return coordinates.compactMap(\.asciiValue).reduce(0, +) % 2 != 0
        
        // return (coordinates.rangeOfCharacter(from: CharacterSet(charactersIn: "aceg")) != nil 
        //         && coordinates.rangeOfCharacter(from: CharacterSet(charactersIn: "2468")) != nil) 
        //     || (coordinates.rangeOfCharacter(from: CharacterSet(charactersIn: "bdfh")) != nil 
        //         && coordinates.rangeOfCharacter(from: CharacterSet(charactersIn: "1357")) != nil)
        
        
        
        
//         if coordinates.rangeOfCharacter(from: CharacterSet(charactersIn: "aceg")) != nil {
//             return coordinates.rangeOfCharacter(from: CharacterSet(charactersIn: "1357")) == nil
//         } else {
//             if coordinates.rangeOfCharacter(from: CharacterSet(charactersIn: "2468")) != nil {
//                 return false
//             }
//         }
//         return true
        
    }
}