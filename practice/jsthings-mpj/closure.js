// Closure = way to get data from a function that is not accessible out of scope
// Functions 'remember' the environment where they were created, access to vars in outer scope
function Person(nameArg){
	var alive = 1;
	let name = nameArg;
	this.getName = function(){
		return name;
	}
}

let me = new Person('Mike');
console.log(me);
console.log(me.getName());
console.log(me.alive);

//this access to perp, mike, is because js has closure
let perp = 'Mike';
let greetMe = () => {
	console.log('hello, ', perp);
}

function init() {
    var name = "Mozilla"; // name is a local variable created by init
    function displayName() { // displayName() is the inner function, a closure
        console.log(name); // displayName() uses variable declared in the parent function    
    }
    displayName();    
}
init();

function makeAdder(x) {
    return function(y) {
        return x + y;
    };
}

var add5 = makeAdder(5);
var add10 = makeAdder(10);

console.log(add5(2));  // 7
console.log(add10(2)); // 12

function MyObject(name, message) {
    this.name = name.toString();
    this.message = message.toString();
}
(function() {
    this.getName = function() {
        return this.name;
    };
    this.getMessage = function() {
        return this.message;
    };
}).call(MyObject.prototype);

console.log(MyObject.prototype)