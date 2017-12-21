document.writeln('Hello, world!');

/*test if object actually has this property or if it was in the proptype chain
 for (myvar in obj) {
         if (obj.hasOwnProperty(myvar)) {
... }
}
*/

for(var i = 0; i<10; i++){
	i%2===0 ? document.writeln('Even') : document.writeln('Odd');
}

/*In JavaScript, arrays are objects, functions are objects, regular expressions are objects, and, of course, objects are objects.*/

//object literals
var empty_object = {};
var stooge = {
         "first-name": "Jerome",
         "last-name": "Howard"
};

var flight = {
         airline: "Oceanic",
         number: 815,
         departure: {
             IATA: "SYD",
             time: "2004-09-22 14:55",
             city: "Sydney"
}, arrival: {
             IATA: "LAX",
             time: "2004-09-23 10:42",
             city: "Los Angeles"
} };

document.writeln(stooge["first-name"]);     // "Joe"
document.writeln(flight.departure.IATA);    // "SYD"

var middle = stooge["middle-name"] || "(none)";
var status = flight.status || "unknown";

document.writeln(middle + ' ' + status);

flight.equipment
//type error" flight.equipment.model 
flight.equipment && flight.equipment.model

stooge['middle-name'] = 'Lester';
stooge.nickname = 'Curly';
flight.equipment = {
    model: 'Boeing 777'
        };
flight.status = 'overdue';


//Objects are passed around by reference. They are never copied:
    var x = stooge;
    x.nickname = 'Curly';
    var nick = stooge.nickname;
        // nick is 'Curly' because x and stooge
        // are references to the same object
    var a = {}, b = {}, c = {};
        // a, b, and c each refer to a
        // different empty object
    a = b = c = {};
        // a, b, and c all refer to
        // the same empty object
if (typeof Object.create !== 'function') {
          Object.create = function (o) {
              var F = function () {};
              F.prototype = o;
              return new F();
};
}
var another_stooge = Object.create(stooge);

//globals are bad um kay
//method invocation
// Create myObject. It has a value and an increment
 // method. The increment method takes an optional
 // parameter. If the argument is not a number, then 1
 // is used as the default.
 var myObject = {
     value: 0,
     increment: function (inc) {
         this.value += typeof inc === 'number' ? inc : 1;
	} 
};
myObject.increment( ); 
document.writeln(myObject.value);
myObject.increment(2);
document.writeln(myObject.value);
// 1 // 3

function add(first, second){
	return first+second;
}
//When a function is not the property of an object, then it is invoked as a function:
//bound to global
var sum = add(3, 4);    // sum is 7

     // Augment myObject with a double method.
myObject.double = function () {
	var that = this; // Workaround.
	var helper = function () {
		that.value = add(that.value, that.value);
	};
	helper(); // Invoke helper as a function. 
};
     // Invoke double as a method.
	myObject.double( ); document.writeln(myObject.value); // 6

/*
Finding HTML Elements
Method  Description
document.getElementById(id) Find an element by element id
document.getElementsByTagName(name) Find elements by tag name
document.getElementsByClassName(name)   Find elements by class name
Changing HTML Elements
Method  Description
element.innerHTML =  new html content   Change the inner HTML of an element
element.attribute = new value   Change the attribute value of an HTML element
element.setAttribute(attribute, value)  Change the attribute value of an HTML element
element.style.property = new style  Change the style of an HTML element
Adding and Deleting Elements
Method  Description
document.createElement(element) Create an HTML element
document.removeChild(element)   Remove an HTML element
document.appendChild(element)   Add an HTML element
document.replaceChild(element)  Replace an HTML element
document.write(text)    Write into the HTML output stream
*/