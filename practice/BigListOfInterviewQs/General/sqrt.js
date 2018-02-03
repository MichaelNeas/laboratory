//Implement squareroot function
// if i got this in an interview i'd cry
let squareRoot = n => {
    let x = n;
    let y = 1;
    let e = 0.000001; 
    while(x - y > e){
        x = (x + y)/2;
        y = n/x;
    }
    return x;
}


console.log(`Difference for approximation of sqrt 50 ${squareRoot(50)- Math.sqrt(50)}`);
console.log(`Difference for approximation of sqrt 49 ${squareRoot(49)- Math.sqrt(49)}`);
console.log(`Difference for approximation of sqrt 123 ${squareRoot(123)- Math.sqrt(123)}`);
console.log(`Difference for approximation of sqrt 5123 ${squareRoot(5123)- Math.sqrt(5123)}`);
console.log(`Difference for approximation of sqrt 5 ${squareRoot(5)- Math.sqrt(5)}`);
console.log(`Difference for approximation of sqrt 9 ${squareRoot(9) - Math.sqrt(9)}`);
console.log(`Difference for approximation of sqrt 120 ${squareRoot(120)- Math.sqrt(120)}`);
console.log(`Difference for approximation of sqrt 490 ${squareRoot(490)- Math.sqrt(490)}`);
console.log(`Difference for approximation of sqrt 54 ${squareRoot(54)- Math.sqrt(54)}`);
console.log(`Difference for approximation of sqrt 90 ${squareRoot(90)- Math.sqrt(90)}`);
console.log(`Difference for approximation of sqrt 4 ${squareRoot(4) - Math.sqrt(4)}`);