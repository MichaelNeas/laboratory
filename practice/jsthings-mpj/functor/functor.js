//functor - making jobs and life easier, but they must return something in a structured form
//Array is the most popular functor, they are things in generally that get mapped and that is it
let stringFunctor = (value, fn) => {
	let chars = value.split('')
	return chars.map(function(char){
		return String.fromCharCode(fn(char.charCodeAt(0)))
	}).join('')
}

function incrementChar(char, func){
	return String.fromCharCode(func(char.charCodeAt(0)));
}


function minus1(value){
	return --value;
}

function plus1(value){
	return ++value;
}

console.log([3,4].map(plus1));
console.log(stringFunctor('ABC', plus1));
console.log(stringFunctor('ABC', minus1));

/* A functor
* 1. Has a tranformation of contents
* 2. Map returns a new functor of the same type of the functor values
*/