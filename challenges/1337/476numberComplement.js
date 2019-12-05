/**
 * Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.
 * @param {number} num
 * @return {number}
 */
var findComplement = function(num) {
    return parseInt(num.toString(2).split('').map(n => parseInt(n) ^ 1).join(''), 2);
};

/**
 * @param {number} num
 * @return {number}
 */
var findComplement = function(num) {
    let r = 0, f = 1;
    while (num > 0) {
        if (num%2 === 0) {
            r += f;
        }
        num = Math.floor(num/2);
        f = 2*f;
    }
    return r;
};