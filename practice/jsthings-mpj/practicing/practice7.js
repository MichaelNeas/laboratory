console.log(typeof "John")                 // Returns "string" 
console.log(typeof 3.14)                   // Returns "number"
console.log(typeof NaN)                    // Returns "number" *
console.log(typeof false)                  // Returns "boolean"
console.log(typeof [1,2,3,4])              // Returns "object"
console.log(typeof {name:'John', age:34})  // Returns "object"
console.log(typeof new Date())             // Returns "object"
console.log(typeof function () {})         // Returns "function"
console.log(typeof myCar)                  // Returns "undefined" *
console.log(typeof null)                   // Returns "object" *

//The constructor property returns the constructor function for all JavaScript variables.
console.log("John".constructor)                 // Returns "function String()  { [native code] }"
console.log((3.14).constructor)                 // Returns "function Number()  { [native code] }"
console.log(false.constructor)                  // Returns "function Boolean() { [native code] }"
console.log([1,2,3,4].constructor)              // Returns "function Array()   { [native code] }"
console.log({name:'John', age:34}.constructor)  // Returns" function Object()  { [native code] }"
console.log(new Date().constructor)             // Returns "function Date()    { [native code] }"
console.log(function () {}.constructor)         // Returns "function Function(){ [native code] }"

function isDate(myDate) {
    return myDate.constructor.toString().indexOf("Date") > -1;
}
console.log(isDate(new Date('sunday')));

//The global method String() can convert numbers to strings.
let x = 8;
console.log(String(x), String(123), String(Math.PI * 2 * 4));
console.log(x.toString(), (123).toString(), (1961*1651/951).toString());

//convert booleans to strings
String(false)        // returns "false"
String(true)         // returns "true"
false.toString()     // returns "false"
true.toString()      // returns "true"

//date to string
String(Date())      // returns "Thu Jul 17 2014 15:38:19 GMT+0200 (W. Europe Daylight Time)"

//Strings to numbers
console.log(Number("3.14"),   
			Number(" "),      
			Number(""),        
			Number("99 88"))  

//parseFloat()	Parses a string and returns a floating point number
//parseInt()	Parses a string and returns an integer

let y = "5";      // y is a string
let d = + y;      // x is a number
let z = "John";   // y is a string
let w = + z;      // x is a number (NaN)

console.log(y,x,z,w);

Number(false)     // returns 0
Number(true)      // returns 1

//expect the unexpected?
console.log(5 + null);    // returns 5         because null is converted to 0
console.log("5" + null);  // returns "5null"   because null is converted to "null"
console.log("5" + 2  );   // returns 52        because 2 is converted to "2"
console.log("5" - 2 );    // returns 3         because "5" is converted to 5
console.log("5" * "2" );  // returns 10        because "5" and "2" are converted to 5 and 2

//JavaScript automatically calls the variable's toString() function when you try to "output" an object or a variable:














