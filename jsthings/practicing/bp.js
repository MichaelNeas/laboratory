console.log('Avoid global variables,  avoid new,  avoid  ==,  avoid eval()');

let values = ["Volvo", "Saab", "Fiat"];
let person = {
    firstName: "John",
    lastName: "Doe",
    age: 50,
    eyeColor: "blue"
};

let x1 = {};           // new object
let x2 = "";           // new primitive string
let x3 = 0;            // new primitive number
let x4 = false;        // new primitive boolean
let x5 = [];           // new array object
let	x6 = /()/;         // new regexp object
let x7 = function(){}; // new function object

//undefined handlers
function myFunction(x, y) {
    if (y === undefined) {
        y = 0;
    }
}

//The eval() function is used to run text as code. In almost all cases, it should not be necessary to use it.
//switch statements use strict comparison
//Never break a return statement.
//If you use a named index, when accessing an array, JavaScript will redefine the array to a standard object.
let myObj;
if (typeof myObj !== "undefined" && myObj !== null) 

//declare outside of loop
var i;
var l = arr.length;
for (i = 0; i < l; i++) 

//Accessing the HTML DOM is very slow, compared to other JavaScript statements.
//document.getElementById("demo").innerHTML = firstName + " " + lastName
//Putting your scripts at the bottom of the page body, lets the browser load the page first
//Avoid using the with keyword. It has a negative effect on speed. It also clutters up JavaScript scopes.
//The with keyword is not allowed in strict mode.
 
 /* windo reserved words
 alert	all	anchor	anchors	area
assign	blur	button	checkbox	clearInterval
clearTimeout	clientInformation	close	closed	confirm
constructor	crypto	decodeURI	decodeURIComponent	defaultStatus
document	element	elements	embed	embeds
encodeURI	encodeURIComponent	escape	event	fileUpload
focus	form	forms	frame	innerHeight
innerWidth	layer	layers	link	location
mimeTypes	navigate	navigator	frames	frameRate
hidden	history	image	images	offscreenBuffering
open	opener	option	outerHeight	outerWidth
packages	pageXOffset	pageYOffset	parent	parseFloat
parseInt	password	pkcs11	plugin	prompt
propertyIsEnum	radio	reset	screenX	screenY
scroll	secure	select	self	setInterval
setTimeout	status	submit	taint	text
textarea	top	unescape	untaint	window
*/

var text = '{ "employees" : [' +
'{ "firstName":"John" , "lastName":"Doe" },' +
'{ "firstName":"Anna" , "lastName":"Smith" },' +
'{ "firstName":"Peter" , "lastName":"Jones" } ]}';
var obj = JSON.parse(text);


