/**
 * Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).
 * @param {number} n - a positive integer
 * @return {number}
 */
var hammingWeight = function(n) {
    return [...n.toString(2)].reduce((sum, curr) => {
        if(curr == 1)
            sum++
        return sum
    }, 0)
};


/**
 * logical bitshifting and operations
 * @param {number} n - a positive integer
 * @return {number}
 */
var hammingWeight = function(n) {
    let ones = 0;
    while(n!=0) {
        ones = ones + (n & 1);
        n = n>>>1;
    }
    return ones;
};