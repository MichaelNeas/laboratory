/* Object.create , creates a new object with the prototype set to a certain object
*  It exists because it is more natural to the prototype model than the new keyword
*/
const car = {
	init: function(sound){
		this.sound = sound;
		return this;
	},
	makeSound: function(){
		console.log(this.sound);
	}
}

function objectCreate(proto){
	const obj = {};
	Object.setPrototypeOf(obj, proto);
	return obj;
}

/*Volx and civ don't have makesound, but when called they refer to the prototype of car*/
const volx = Object.create(car).init("Vroooom");
volx.makeSound();

const civ = objectCreate(car).init("Chugga chugga");
civ.makeSound();

console.log('Is civ a car? ', car.isPrototypeOf(civ));