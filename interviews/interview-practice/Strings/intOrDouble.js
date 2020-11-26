//Determine if a String is an int or a double, oh javascript
const assert = require('assert');

const intOrDoub = str => {
    if (str % 1 === 0)
        return 'int';
    else
        return 'double';
}

assert.equal(intOrDoub('1'),'int',"1 is int");
assert.equal(intOrDoub('1.1'),'double',"1.1 is double");
assert.equal(intOrDoub('-123'),'int',"-123 is int"); //lol -0 === 0
assert.equal(intOrDoub(' 1 '),'int'," _1_ is int");