//Write a multiply function that multiplies 2 integers without using *
const assert = require('assert');

let multiply = (a, b) => {
    let sum = 0;
    while(b > 0){
        sum += a;
        b--;
    }
    return sum;
}

assert.equal(multiply(2,3), 2*3, 'multiplying is hard');
assert.equal(multiply(3,33), 3*33, 'multiplying is hard');
assert.equal(multiply(4,323), 4*323, 'multiplying is hard');
assert.equal(multiply(5,30), 5*30, 'multiplying is hard');
assert.equal(multiply(6,90), 6*90, 'multiplying is hard');
assert.equal(multiply(7,3), 7*3, 'multiplying is hard');
assert.equal(multiply(8,4), 8*4, 'multiplying is hard');
assert.equal(multiply(9,7), 9*7, 'multiplying is hard');
assert.equal(multiply(20,8), 20*8, 'multiplying is hard');
console.log('everything looks good here');