/** 99% with the mod mod
 *  A self-dividing number is a number that is divisible by every digit it contains.
 * For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
 * Also, a self-dividing number is not allowed to contain the digit zero.
 * Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible. 
 * @param {number} left
 * @param {number} right
 * @return {number[]}
 */
var selfDividingNumbers = function(left, right) {
    let ans = []
    for(let i=left; i<=right; i++){
        let temp = i;
        while(temp>0){
            if(i%(temp%10) == 0){
                temp = Math.floor(temp/10)
            } else {
                temp = -1
            }
        }
        if(temp != -1) ans.push(i)
    }
    return ans
};