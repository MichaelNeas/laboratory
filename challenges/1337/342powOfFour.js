/**
 * @param {number} num
 * @return {boolean}
 */
var isPowerOfFour = function(num) {
    if(num === 0)return false
    return Math.log(num) / Math.log(4) === Math.floor(Math.log(num) / Math.log(4));
};

//0x55555555 is to get rid of those power of 2 but not power of 4
//so that the single 1 bit always appears at the odd position 
let isPowerOfFour = num => num > 0 && (num&(num-1)) == 0 && (num & 0x55555555) != 0;
