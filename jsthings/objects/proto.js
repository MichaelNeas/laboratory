/*
* Proto vs prototype
* Proto are references to objects
* Proto delegation - it is the property on a object that actually points out the prototype that has been set on that object
* Prototype - set as the property only if the new keyword is used
*/

let food = {
	flavor: 'sweet'
}

let honeycomb = {
	taste: 'delicious'
}

Object.setPrototypeOf(honeycomb, food);

food.size = 12;

console.log(honeycomb.flavor);
console.log(honeycomb.size);
//reference to the SAME object
console.log(honeycomb.__proto__);

function Drink() {}
Drink.prototype.taste = "Clean";
let water = new Drink();
console.log(water.taste);

console.log(water.__proto__);
console.log(water.prototype);	//undefined

function Car() {}
console.log(Car.prototype);

let civic = {};
console.log(civic.prototype); //undefined
console.log(civic.__proto__); // all objects in js delegate to, global

console.log(civic.__proto__ === Object.prototype);

//DONT DO THIS
Object.prototype.waffle = 'adbjaksvdjakhsv';

console.log(civic.waffle);

//object is a function, otherwise you wouldnt be able to do a 'new' function