/**
 * Bit wise addition
 * @param {number} a
 * @param {number} b
 * @return {number}
 */
var getSum = function(a, b) {
    return ((a & b ) != 0) ? getSum(a ^ b, (a & b) << 1) : (a ^ b);
};