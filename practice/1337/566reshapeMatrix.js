/**
 * In MATLAB, there is a very useful function called 'reshape', which can reshape a matrix into a new one with different size but keep its original data.
 * You're given a matrix represented by a two-dimensional array, and two positive integers r and c representing the row number and column number of the wanted reshaped matrix, respectively.
 * The reshaped matrix need to be filled with all the elements of the original matrix in the same row-traversing order as they were.
 * If the 'reshape' operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix. 
 * @param {number[][]} nums
 * @param {number} r
 * @param {number} c
 * @return {number[][]}
 */
var matrixReshape = function(nums, r, c) {
    if(r*c != nums[0].length*nums.length) return nums
    
    let rstart = 0
    let cstart = 0
    let newMatrix = [[]]
    for(let i=0;i<nums.length;i++){
        for(let j=0;j<nums[0].length;j++){
            if(newMatrix[rstart].length >= c) {
                rstart += 1
                cstart = 1
                newMatrix.push([nums[i][j]])
            }else{
                newMatrix[rstart][cstart] = nums[i][j]
                cstart++
            }

        }
    }
    return newMatrix
};