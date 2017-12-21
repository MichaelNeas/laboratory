/*
* Prototypes are a js way to achieve inheritence
* Class === blueprint, prototype === deligate
* In newer versions of js there is class but
*	1. Prototypes are simple and powerful
*	2. Class keyword is really a prototype 
* Prototypes do not create copies, they deligate action to the original object
* -for this object use this other object as a backup, if something doesnt exist check its prototype
*/

function makeNoise(){
	console.log(this)
	console.log(this.sound)
}

let computer = {
	//makeNoise: makeNoise
	makeNoise
}

let gameboy = {
	sound : 'Dundun!'
}

let macbook = {
	sound : 'Vrrrrrrrmmmmm'
}

let greenGB = {
	startSound : function(){
		console.log(this.sound.toUpperCase())
	}
}

//will look at gameboys prototype -> computer and make that noise!
Object.setPrototypeOf(gameboy, computer)
Object.setPrototypeOf(macbook, computer)


computer.makeNoise = function(){
	console.log('salkdbflskadbfkljjabsfkjjbskjbfksdab', this.sound)
}

gameboy.makeNoise()
macbook.makeNoise()

Object.setPrototypeOf(greenGB, gameboy)
greenGB.startSound()