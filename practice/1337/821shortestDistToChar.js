/**
 * Given a string S and a character C, return an array of integers representing the shortest distance from the character C in the string.
 * @param {string} S
 * @param {character} C
 * @return {number[]}
 */
var shortestToChar = function(S, C) {
    let findRight = starting => {
        for(let i=starting;i<S.length; i++){
            if(S[i] === C) return i
        }
    }
        
    let mostRecentIndexLeft = -1
    let mostRecentIndexRight = findRight(0)

    return [...S].map((el, i) => {
        let leftDistance = Math.abs(i - mostRecentIndexLeft)
        let rightDistance = mostRecentIndexRight - i
        if(rightDistance === 0){
            mostRecentIndexLeft = mostRecentIndexRight
            mostRecentIndexRight = findRight(i+1)
            return 0
        }
        
        if(leftDistance > rightDistance || mostRecentIndexLeft === -1) 
            return rightDistance
        else 
            return leftDistance
    })
};