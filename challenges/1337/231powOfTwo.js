/**
 * Given an integer, write a function to determine if it is a power of two.
 * @param {number} n
 * @return {boolean}
 */
var isPowerOfTwo = function(n) {
    if(n === 0) return false
    return Math.log2(n) === Math.floor(Math.log2(n))
};

// super cool solution
/**
 * @param {number} n
 * @return {boolean}
 */
var isPowerOfTwo = function(n) {
    if(n<=0) return false;
    return !(n&(n-1));
};