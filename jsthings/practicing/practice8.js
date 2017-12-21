x=5;
let str = "Mikeneasz";
let n = str.search(/iken/i);
console.log(n)
let m = str.search("iken");
console.log(m)
let res = str.replace("Mike", "Albatros");
console.log(res);
/*
i	Perform case-insensitive matching
g	Perform a global match (find all matches rather than stopping after the first match)
m	Perform multiline matching
*/

function myFunction() {
    var message, x;
    message = document.getElementById("message");
    message.innerHTML = "";
    x = document.getElementById("demo").value;
    debugger;
    try { 
        if(x == "") throw "is empty";
        if(isNaN(x)) throw "is not a number";
        x = Number(x);
        if(x > 10) throw "is too high";
        if(x < 5) throw "is too low";
    }
    catch(err) {
        message.innerHTML = "Error: " + err + ".";
    }
    finally {
        document.getElementById("demo").value = "";
    }
}

var x;
console.log(x); //hoisting requires var, bad
// "use strict"; Defines that JavaScript code should be executed in "strict mode".
/*Strict mode makes it easier to write "secure" JavaScript.

Strict mode changes previously accepted "bad syntax" into real errors.

As an example, in normal JavaScript, mistyping a variable name creates a new global variable. In strict mode, this will throw an error, making it impossible to accidentally create a global variable.

In normal JavaScript, a developer will not receive any error feedback assigning values to non-writable properties.

In strict mode, any assignment to a non-writable property, a getter-only property, a non-existing property, a non-existing variable, or a non-existing object, will throw an error.

Future reserved keywords are not allowed in strict mode. These are:

implements
interface
let
package
private
protected
public
static
yield
*/