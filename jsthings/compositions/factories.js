//Factories are functions that create objects and return them, instead of classes, doesnt require binding FLEXIBLE

//factory function for dog.
const dog = () => {
	const sound = 'woof'
	return{
		talk: () => console.log(sound)
	}
}

const sniffles = dog()
sniffles.talk()

/*VERSUS*/

//class for dog.
/*
class Dog {
	constructor() {
		this.sound = 'woof'
	}
	talk() {
		console.log(this.sound)
	}
}
const sniffles = new Dog();
sniffles.talk()
*/
/* $('button.myButton')
*	.click(_ => sniffles.talk() )
*/

//classes are .0002 s faster than classes so it's negligable 
