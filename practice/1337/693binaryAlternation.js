/**
 * Given a positive integer, check whether it has alternating bits: namely, if two adjacent bits will always have different values.
 * @param {number} n
 * @return {boolean}
 */
var hasAlternatingBits = function(n) {
    let bin = n.toString(2)
    for(let i = 1; i<bin.length; i++){
        if(bin[i] === bin[i-1]) return false
    }
    return true
};