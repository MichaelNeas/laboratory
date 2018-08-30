//Food const with init function and eat function FAST
const food = {
	init: function (type) {
		this.type = type
	},
	eat: function() {
		console.log('you ate the ' + this.type)
	}
}

//declare waffle and carrot, not creating copies, but pointers
const waffle = Object.create(food)
const carrot = Object.create(food)

//redefine eat by manipulating the prototype of this
/*food.eat = function() {
	console.log('You definitely ate the ' + this.type.toUpperCase())
}*/

//food.init('waffle')
food.eat()
food.type = 'aosndlasknd'
food.eat()

carrot.init('carrot')
carrot.eat()

console.log('waffle is is food', food.isPrototypeOf(waffle))
console.log('int is food', food.isPrototypeOf(1233243))
console.log('carrot is food',food.isPrototypeOf(carrot))