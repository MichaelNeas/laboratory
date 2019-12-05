/**
 * Given a matrix A, return the transpose of A.
 * The transpose of a matrix is the matrix flipped over it's main diagonal, switching the row and column indices of the matrix.
 * @param {number[][]} A
 * @return {number[][]}
 */
var transpose = function(A) {
    let newMatrix = new Array()
    for(let i=0;i<A[0].length;i++){
        let temp = new Array()
        for(let j=0;j<A.length;j++){
            temp.push(A[j][i])
        }
        newMatrix.push(temp)
    }
    return newMatrix
};