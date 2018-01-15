//Check if a String is composed of all unique characters
const assert = require('assert');

const isComposedOfUniques = str => {
    let i;
    const store = {};
    for(i=0; i<str.length; i++){
        if(store[str.charAt(i)] === undefined) 
            store[str.charAt(i)] = 1;
        else 
            return false;
    }
    return true;
}

assert.equal(isComposedOfUniques("asdfghjklqwertyuiop"), true, 'valid string');
assert.equal(isComposedOfUniques("asdfghjklqwertyuipop"), false, 'invalid string');