/**
 * Given two strings representing two complex numbers.
 * You need to return a string representing their multiplication. Note i2 = -1 according to the definition. 
 * @param {string} a
 * @param {string} b
 * @return {string}
 */
var complexNumberMultiply = function(a, b) {
    let as = a.split("+") 
    let bs = b.split("+")
    let other = (as[0]*bs[0]) + ((as[1].replace("i", "")*bs[1].replace("i", ""))*-1)
    let ival = (as[0]*bs[1].replace("i", "")) + (as[1].replace("i", "")*bs[0])
        
    return `${other}+${ival}i`
};