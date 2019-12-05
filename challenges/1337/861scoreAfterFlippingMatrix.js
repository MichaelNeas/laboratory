/**
 * We have a two dimensional matrix A where each value is 0 or 1.
 * A move consists of choosing any row or column, and toggling each value in that row or column: changing all 0s to 1s, and all 1s to 0s.
 * After making any number of moves, every row of this matrix is interpreted as a binary number, and the score of the matrix is the sum of these numbers.
 * Return the highest possible score.
 * @param {number[][]} A
 * @return {number}
 */
var matrixScore = function(A) {
    let flipCol = index => {
        for(let i=0;i<A.length; i++){
            A[i][index] = A[i][index] ^ 1
        }
    }
    
    let flipRow = index => {
        for(let i=0;i<A[0].length; i++){
            A[index][i] = A[index][i] ^ 1
        }
    }
    
    for(let i=0; i<A[0].length; i++){
        let colVal = 0
        for(let j=0; j<A.length; j++){
            // get the most value out of flipping the first column
            if(i === 0 && A[j][i] === 0){
                flipRow(j)
                colVal = A.length
            }else{
                colVal += A[j][i]
            }
        }
        if(colVal < (A.length/2)){
            flipCol(i)
        }
    }
    
    let sum = 0
    for(let i=0;i<A.length;i++){
        sum += parseInt(A[i].join(''), 2);
    }
    return sum
};