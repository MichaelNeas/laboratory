var x = 34.00;    // A number with decimals
var y = 34;       // A number without decimals
console.log(x + ': ' + typeof(x) + y + ': ' + typeof(y));

var x = 123e5;    // 12300000
var y = 123e-5;   // 0.00123
console.log(x + ': ' + typeof(x) + y + ': ' + typeof(y));

var x = 0.2 + 0.1;         // x will be 0.30000000000000004
console.log(x + ': ' + typeof(x) + ' floating point is weird in js, lol');

var x = (0.2 * 10 + 0.1 * 10) / 10;       // x will be 0.3
console.log(x);

var x = 0xFF;  //15*16 + 15*1
console.log(x);

var convert = x.toString(2);
console.log(convert);

console.log(typeof(Infinity));

console.log(2/0);
console.log(-2/0);

console.log(2 * '10n');
console.log(2 * '10');

//methods
console.log(typeof x.toString());

var x = 532.2312312;
console.log(x.toFixed(2));
console.log(x.toPrecision(2));
console.log(x.valueOf());

//number
x = true;
Number(x);        // returns 1
x = false;     
Number(x);        // returns 0
x = new Date();
Number(x);        // returns 1404568027739
x = "10"
Number(x);        // returns 10
x = "10 20"
Number(x);        // returns NaN

parseInt("10");         // returns 10
parseInt("10.33");      // returns 10
parseInt("10 20 30");   // returns 10
parseInt("10 years");   // returns 10
parseInt("years 10");   // returns NaN 

parseFloat("10");        // returns 10
parseFloat("10.33");     // returns 10.33
parseFloat("10 20 30");  // returns 10
parseFloat("10 years");  // returns 10
parseFloat("years 10");  // returns NaN