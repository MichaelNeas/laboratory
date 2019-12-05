/*
* Class keyword is a leaky abstraction that uses this prototyping under the hood
* Prototype is on every function object
* If the function returns an object it takes the place of the new
*/
function Person(saying){
	this.saying = saying;
	/*return{
		dumbobj : true;
	}*/
}

Person.prototype.talk = function(){
	console.log('Person says', this.saying);
}

/*
* Redefining new
* apply is like bind but returns immediately
*/
function spawn(constructor){
	let obj = {}; //1
	Object.setPrototypeOf(obj, constructor.prototype); //2
	let argsArray = Array.prototype.slice.apply(arguments);
	return constructor.apply(obj, argsArray.slice(1)) || obj; //3
	//constructor.apply(obj);
	//return obj;
}

/*
* 1. New creates a new plain object with no properties
* 2. It sets the prototype of the new object to be that objct
* 3. Execute constructor with 'this'
* 4. It returns the new object that it created, and execute the constructor, unless  it returns an obj
*/
let andrew = new Person('Creatures')
andrew.talk();

let mike = spawn(Person,'Aye')
mike.talk();