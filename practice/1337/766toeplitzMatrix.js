/**
 * A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.
 * Now given an M x N matrix, return True if and only if the matrix is Toeplitz.
 * @param {number[][]} matrix
 * @return {boolean}
 */
var isToeplitzMatrix = function(matrix) {
    let fullRow = matrix[0]
    for(i=1;i<matrix.length; i++){
        fullRow.unshift(matrix[i][0])
        fullRow.pop()        
        for(let j=1; j<fullRow.length; j++){
            if(matrix[i][j] !== fullRow[j])
                return false
        }
    }
    return true
};