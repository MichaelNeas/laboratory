const counter = arr => `There are ${arr.length} elements in this array`;
const addr = (a,b) => `sum is equal to ${a + b}`;

//module.exports.bleh = m => m*m;

// literal notation
module.exports = {
  adder: addr,
  count: counter
};