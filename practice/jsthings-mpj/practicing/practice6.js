/* In js arrays use numbered indexes
* Objects use named indexes
* Arrays are a special kind of object with numbered indexes
*/

let fruits = ["Banana", "Orange", "Apple", "Mango"];
let vegetables = ["Spinach", "Potato"];
console.log(typeof fruits);             // returns object

Array.isArray(fruits);

function isArray(x) {
    return x.constructor.toString().indexOf("Array") > -1;
}

console.log(isArray(fruits));
console.log(fruits instanceof Array);
console.log(fruits.toString());
console.log(fruits.join('--'));

let fruit = fruits.pop();
console.log(fruits);
console.log(fruit);
fruits.push("Kiwi"); 

console.log(fruits);
fruits.shift();            // Removes the first element "Banana" from fruits
console.log(fruits);
fruits.unshift("Lemon");    // Adds a new element "Lemon" to fruits
console.log(fruits);
fruits[0] = "Kiwi";        // Changes the first element of fruits to "Kiwi"
fruits[fruits.length] = "Kiwi";          // Appends "Kiwi" to fruit
fruits.splice(2, 0, "Lemon", "Kiwi");
console.log(fruits);
fruits.splice(0, 1);        // Removes the first element of fruits
let food = fruits.concat(vegetables);
console.log(food); //concat them
let citrus = fruits.slice(1);
console.log(citrus);
console.log(fruits);
console.log(food.reverse());
console.log(food.sort());

console.log(Boolean(1));
//Boolean will return false for anything without a "Real"
/*
&	AND	x = 5 & 1			0101 & 0001	0001	1
|	OR	x = 5 | 1			0101 | 0001	0101	5
~	NOT	x = ~ 5					~0101	1010	10
^	XOR	x = 5 ^ 1			0101 ^ 0001	0100	4
<<	Left shift	x = 5 << 1	0101 << 1	1010	10
>>	Right shift	x = 5 >> 1	0101 >> 1	0010	2
*/
let day;
switch (new Date().getDay()) {
    case 0:
        day = "Sunday";
        break;
    case 1:
        day = "Monday";
        break;
    case 2:
        day = "Tuesday";
        break;
    case 3:
        day = "Wednesday";
        break;
    case 4:
        day = "Thursday";
        break;
    case 5:
        day = "Friday";
        break;
    case 6:
        day = "Saturday";
}

console.log(day);

let person = {fname:"John", lname:"Doe", age:25}; 

let text = "";
let x;
for (x in person) {
    text += person[x];
}
console.log(text);

text = "";

for (i = 0; i < 10; i++) {
    if (i === 3) { continue; }
    text += i + ",";
}

console.log(text);

text = "";

for (i = 0; i < 10; i++) {
    if (i === 3) { break; }
    text += i + ",";
}

console.log(text);
