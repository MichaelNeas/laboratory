//100
let x = 4;
//10000 =>  16
console.log(x << 2);
console.log(x);
//1
console.log(x >> 2);

let y=2;

//2^3 === 8
console.log(y<<3);
console.log(y*8);

var length = 16;                               // Number
var lastName = "Johnson";                      // String
var cars = ["Saab", "Volvo", "BMW"];           // Array
var xobj = {firstName:"John", lastName:"Doe"};    // Object

console.log(xobj['firstName'], xobj.lastName)

//name : value
var person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};

console.log(typeof undefined)             // undefined
console.log(typeof null)                  // object
console.log(null === undefined)           // false
console.log(null == undefined)            // true

//Avoid String, Number, and Boolean objects. They complicate your code and slow down execution speed.

myFunction();

// code here can use carName 

function myFunction() {
    var carName = "Volvo";
}

//In HTML, the global scope is the window object. All global variables belong to the window object.
/*The lifetime of a JavaScript variable starts when it is declared.

Local variables are deleted when the function is completed.

Global variables are deleted when you close the page.*/

console.log('\'')	//single quote'
console.log('\"')	//double quote"
console.log('\\')	//backslash
console.log('\n')	//new line
console.log('\r')	//carriage return
console.log('\t')	//tab
console.log('\b')	//backspace
console.log('\f')	//form feed

var x = new String("John");             
var y = new String("John");

// (x == y) is false because x and y are different objects
// (x == x) is true because both are the same object