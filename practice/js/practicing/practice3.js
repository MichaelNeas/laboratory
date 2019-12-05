var txt = "ABCDEFXGHIJKLMNOPQRSTUVWXYZ";
var sln = txt.length;
console.log('og string: ' + txt);
console.log(txt + ': ' + sln);

var whereIs = txt.indexOf('M');
console.log('M is: ' + whereIs);

var last = txt.lastIndexOf('X');
console.log('last index of X: ' + last)

var slicein = txt.slice(6, 15);
console.log(slicein);

var sliceoffFront = txt.slice(6);
console.log(sliceoffFront);

var n = txt.replace(/RSTUVWXY/g,"Mike Neas");
console.log(n);

var dropIt = txt.toLowerCase();
console.log(dropIt);

var concatEverything = dropIt.concat(txt, n, dropIt);
console.log(concatEverything);

var character = txt.charAt(4);
var charCode = txt.charCodeAt(4);

console.log(character + ' : ' + charCode);

var splitIT = txt.split('');
console.log(splitIT);