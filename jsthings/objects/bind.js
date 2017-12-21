/*
* There is no right way to do object creation in js
* Basic obj and binding
* Functionality binded with data
* Scheme history allows higher order functions (takes one or more functions as arguments or returns a function)
*/

let mike = {
	sound: 'hai',
	talk: function(){
		console.log(this.sound)
	}
}

mike.talk()

/*Undefined because object oriented nature clashes with functional without bind
let talkFunc = mike.talk(); //assign function to a variable, but it is now a function with no connection to mike
let boundFunction = talkFunc.bind(mike)
boundFunction()
*/

let button = document.getElementById('aButton')

button.addEventListener(
	'click',
	mike.talk.bind(mike)
)