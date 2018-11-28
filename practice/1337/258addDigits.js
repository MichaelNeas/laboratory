/**
 * Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
 * @param {number} num
 * @return {number}
 */
let addDigits = function(num) {
    let digArray = breakIntIntoDigits(num)
    while(digArray.length > 1){
        num = digArray.reduce((acc, curr) => acc + curr, 0)
        digArray = breakIntIntoDigits(num)
    }
    return num
};


let breakIntIntoDigits = intValue => intValue.toString().split('').map(Number)



// Best solution

/**
 * @param {number} num
 * @return {number}
 */
var addBestDigits = num => (num - 1) % 9 + 1;


/**
 * @param {number} num
 * @return {number}
 */
var addLOLDigits = function(num) {
    let newNum = "" + num; // please never change js
    while(newNum.length !== 1) {
        let sum = 0;
        for (let i = 0;i < newNum.length;i++) {
            sum += +newNum[i];
        }
        newNum = "" + sum; 
    }
    return newNum;
};
