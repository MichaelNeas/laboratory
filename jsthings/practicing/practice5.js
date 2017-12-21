console.log(Math.PI);

console.log(Math.round(4.7));
console.log(Math.round(4.5));
console.log(Math.round(4.3));
console.log(Math.ceil(3.1));
console.log(Math.floor(3.9));

console.log(Math.pow(3,2));

console.log(Math.sqrt(8));
console.log(Math.sqrt(9));

console.log(Math.abs(-3));

Math.sin(90 * Math.PI / 180);     // returns 1 (the sine of 90 degrees)
Math.cos(0 * Math.PI / 180);     // returns 1 (the cos of 0 degrees)

//Math min and max takes a list of numbers
var numberarray = [3, 2, 65, 12, 23, 123, 1, -2];
console.log(Math.max(3, 2, 65, 12, 23, 123, 1, -2));
console.log(Math.min(...numberarray)); //spread operator
/*The spread syntax allows an expression to be expanded in places where multiple arguments (for function calls) or multiple elements (for array literals) or multiple variables  (for destructuring assignment) are expected.
*/

var holder = '';
for(var i = 0; i<10; i++){
	holder = holder.concat(' ', (Math.round(Math.random() * 10)));
}
console.log(holder);

function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min) ) + min;
}

console.log(getRndInteger(4,19));

console.log(Date());
console.log(new Date("October 13, 2014 11:13:00"));
console.log(new Date(86400000));
//year, month, day, hour, minute, second, and millisecond, in that order
console.log(new Date(99,5,24,11,33,30,0));
console.log(new Date().toUTCString());
console.log(new Date().toDateString());
console.log(new Date("2015-03-25"));
console.log(new Date("2015-03"));
console.log(new Date("2015"));
console.log(new Date('2015-03-25T12:00:00'));
var d = new Date("Wed Mar 25 2015 09:56:24 GMT+0100 (W. Europe Standard Time)");
console.log(d);

/*getDate()	Get the day as a number (1-31)
getDay()	Get the weekday as a number (0-6)
getFullYear()	Get the four digit year (yyyy)
getHours()	Get the hour (0-23)
getMilliseconds()	Get the milliseconds (0-999)
getMinutes()	Get the minutes (0-59)
getMonth()	Get the month (0-11)
getSeconds()	Get the seconds (0-59)
getTime()	Get the time (milliseconds since January 1, 1970)*/

/*setDate()	Set the day as a number (1-31)
setFullYear()	Set the year (optionally month and day)
setHours()	Set the hour (0-23)
setMilliseconds()	Set the milliseconds (0-999)
setMinutes()	Set the minutes (0-59)
setMonth()	Set the month (0-11)
setSeconds()	Set the seconds (0-59)
setTime()	Set the time (milliseconds since January 1, 1970)*/