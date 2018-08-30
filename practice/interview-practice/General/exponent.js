//Implement an exponent function (bonus: now try in log(n) time)
const assert = require('assert');

let exponent = (base, pow) => {
    if(pow === 0) return 1;

    let flip = false;
    if(pow<0){
        pow*=-1
        flip = true;
    }
    let sum = base;
    while(pow>1){
        sum *= base;
        pow--;
    }

    return flip ? 1/sum : sum;
}

assert.equal(exponent(2,2), Math.pow(2,2), "2 pow 2");
assert.equal(exponent(5,10), Math.pow(5,10), "5 pow 10");
assert.equal(exponent(-2,5), Math.pow(-2,5), "-2 pow 5");
assert.equal(exponent(0,80), Math.pow(0,80), "0 pow 80");
assert.equal(exponent(1,4), Math.pow(1,4), "1 pow 4");
assert.equal(exponent(3,-4), Math.pow(3,-4), "3 pow -4");
assert.deepStrictEqual(exponent(0,0), Math.pow(0,0), "0 pow 0");
assert.equal(exponent(19,0), Math.pow(19,0), "19 pow 0");

let powerLog = (base, pow) => {
    let flip = false;
    if(pow<0){
        pow*=-1
        flip = true;
    }

    let sum = 1;
    while (pow > 0){
        if (pow & 1)
            sum *= base;

        pow = pow>>1; // pow/2
        base = base*base;  // base^2
    }

    return flip ? 1/sum : sum;
}

assert.equal(powerLog(2,2), Math.pow(2,2), "log 2 pow 2");
assert.equal(powerLog(2,50), Math.pow(2,50), "log 2 pow 50");
assert.equal(powerLog(5,10), Math.pow(5,10), "log 5 pow 10");
assert.equal(powerLog(-2,5), Math.pow(-2,5), "log -2 pow 5");
assert.equal(powerLog(0,80), Math.pow(0,80), "log 0 pow 80");
assert.equal(powerLog(1,4), Math.pow(1,4), "log 1 pow 4");
assert.equal(powerLog(3,-4), Math.pow(3,-4), "log 3 pow -4");
assert.deepStrictEqual(powerLog(0,0), Math.pow(0,0), "log 0 pow 0");
assert.equal(powerLog(19,0), Math.pow(19,0), "log 19 pow 0");