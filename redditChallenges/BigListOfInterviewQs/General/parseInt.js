// The parseInt function converts its first argument to a string, parses it, and returns an integer or NaN. If not NaN, the returned value will be the integer that is the first argument taken as a number in the specified radix (base).
const assert = require('assert');

// kappa answer
let kappaParseInt = num => Number(num)

let myRealParseInt = val => {
    let leadOp, numArr, base=1;
    if (typeof val === "number")
        return val;
    numArr = /^\s*((\-|\+)?[0-9]+)\s*/g.exec(val);
    
    if(numArr !== null)
        numArr = numArr[0].trim().split("");
    else    
        return NaN

    if(numArr[0] === "-" || numArr[0] === "+"){
        leadOp = numArr[0];
        numArr.shift();
    }

    let ans = numArr.reduceRight((acc, curr, i) => {
        let temp = curr * base;
        acc += temp;
        base *= 10;
        return acc;
    }, 0) 
    return leadOp === "-" ? -1 * ans : ans;  
}


let kappaAns = kappaParseInt("2")
console.log(kappaAns, typeof kappaAns); 

assert.equal(myRealParseInt("-24123basidiub12412080has98d"), parseInt("-24123basidiub12412080has98d"), "nospace");
assert.deepStrictEqual(myRealParseInt("- 24123basidiub12412080has98d"), parseInt("- 24123basidiub12412080has98d"), "space after sign");
assert.equal(myRealParseInt(" -24123basidiub12412080has98d"), parseInt(" -24123basidiub12412080has98d"), "space before sign");
assert.deepStrictEqual(myRealParseInt(" - 24sdf123"), parseInt(" - 24sdf123"), "before and after sign");
assert.equal(myRealParseInt(" +24sdf123"), parseInt(" +24sdf123"), "plus sign");
assert.deepStrictEqual(myRealParseInt(" + 24sdf123"), parseInt(" + 24sdf123"), "plus sign spaces");
assert.deepStrictEqual(myRealParseInt(" sdf123"), parseInt(" sdf123"), "numbers after");
assert.deepStrictEqual(myRealParseInt(" sdf    123"), parseInt(" sdf    123"), "numbers after big spaces");