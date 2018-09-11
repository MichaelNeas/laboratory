/**
 * Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 * @param {number} numRows
 * @return {number[][]}
 */
var generate = function(numRows) {
    let ans = []
    for(let i=0; i<numRows; i++){
        for(let j=0; j<i+1;j++){
            if(ans[i]){
                let sum = (ans[i-1][j-1] || 0) + (ans[i-1][j] || 0)
                ans[i].push(sum)
            }
            else 
                ans.push([1])
        }
    }
    return ans
};