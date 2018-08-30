for(var i = 0; i<10; i++){
	console.log(i);
}

//one type of scope for es5
console.log('after loop', i);

function counter(){
	for (var f = 0; f<10; f++){
		console.log(f);
	}
}
//counter()
//console.log('after: ', f);

//immediately invoked function
"use strict"//allows for haulting of hoisting to outter scopes
var g = 9999999999
;(function () {
	for(var g = 0; g<10; g++){
		console.log(g);
	}
})()
console.log('after: ', g);
//js variables are hoisted to the top of their function, it always pulls the var declarations to the top

//let introduces block scope, USE LET EVERYWHERE
"use strict"
var h;
h = 9999999999
for(let h=0; h<10; h++){
	console.log(h)
}
if(true){
	let h=888888;
}
console.log('after it all: ', g)

//const is just like let but you can't really change it, you cannot reassign it.
//prevents complete reassignments but you can change objects
"use strict";
const cat = 'catname'
//cat = 'newcatname' // cannot rename
const x = {
	y: 5
}
x.y =6
console.log(x);

/********* MINIMIZE MUTABLE STATES **************/