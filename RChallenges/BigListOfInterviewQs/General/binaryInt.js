//Write a function that prints out the binary form of an int
const assert = require('assert');

let binaryInt = number => {
    let output = "";
    while(number > 0){
        output = number%2 + output;
        number = Math.floor(number/2)
    }
    return output;
};

console.log('What\'s binary of 156? ', binaryInt(156));
console.log('What\'s binary of 120973? ', binaryInt(120973));
console.log('What\'s binary of 9? ', binaryInt(9));
console.log('What\'s binary of 101? ', binaryInt(101));