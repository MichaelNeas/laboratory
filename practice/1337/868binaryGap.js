/**
 * Given a positive integer N, find and return the longest distance between two consecutive 1's in the binary representation of N.
 * @param {number} N
 * @return {number}
 */
var binaryGap = function(N) {
    let largestCount = 0
    let currCount = 0
    let bin = N.toString(2)
    for(let i=0; i<bin.length; i++){
        if(bin[i] == "1"){
            if(currCount > largestCount){
                largestCount = currCount
            }
            currCount = 0
        }
        currCount++
        
    }
    return largestCount
};