/**
 * @param {string} a
 * @param {string} b
 * @return {string}
 */
var addBinary = function(a, b) {
    let sum = ""
    let carry = 0
    let place = 0
    while(a.length > place || b.length > place){
        let val = (Number(a[a.length-1-place]) || 0) + (Number(b[b.length-1-place]) || 0) + carry
        if(val > 1){
            carry = 1
            sum = val-2 + sum
        }else{
            carry = 0
            sum = val + sum
        }
        place++
    }
    if(carry){
        sum = 1+sum
    }
    return sum
};