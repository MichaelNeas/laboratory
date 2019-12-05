/**
 * Reverse bits of a given 32 bits unsigned integer.
 * @param {number} n - a positive integer
 * @return {number} - a positive integer
 */
var reverseBits = function(n) {
    let ans = 0;
    for (let i = 0; i < 32; i += 1) {
        ans <<= 1;
        ans |= n & 1;
        n >>= 1;
    }
    return ans >>> 0;
};