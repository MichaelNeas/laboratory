// Implement the class SubrectangleQueries which receives a rows x cols rectangle as a matrix of integers in the constructor and supports two methods:

// 1. updateSubrectangle(int row1, int col1, int row2, int col2, int newValue)

// Updates all values with newValue in the subrectangle whose upper left coordinate is (row1,col1) and bottom right coordinate is (row2,col2).
// 2. getValue(int row, int col)

// Returns the current value of the coordinate (row,col) from the rectangle.

class SubrectangleQueries {
    var rectangle: [[Int]]

    init(_ rectangle: [[Int]]) {
        self.rectangle = rectangle
    }
    
    func updateSubrectangle(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int, _ newValue: Int) {
        for row in row1...row2 {
            for col in col1...col2 {
                rectangle[row][col] = newValue
            }
        }
    }
    
    func getValue(_ row: Int, _ col: Int) -> Int {
        rectangle[row][col]
    }
}