/**
 * Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 * The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 * You may assume the integer does not contain any leading zero, except the number 0 itself.
 * @param {number[]} digits
 * @return {number[]}
 */
var plusOne = function(digits) {
    for(let i=digits.length-1; i>=0;i--){
        digits[i]+=1
        if(digits[i]>9){
            digits[i]=0 
            if(i===0){
                digits.unshift(1)
                return digits
            }
                
        }
        else
            return digits
    }
    return digits
};


//100
var plusOne = function(digits) {
    for(var i = digits.length - 1; i >= 0; i--){
      if(++digits[i] > 9) digits[i] = 0;
      else return digits;
    }
    digits.unshift(1);
    return digits;
  };