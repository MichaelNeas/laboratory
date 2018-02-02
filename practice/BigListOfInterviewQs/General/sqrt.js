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


console.log(squareRoot(50))
console.log(squareRoot(49))
console.log(squareRoot(123))
console.log(squareRoot(5123))
console.log(squareRoot(5))
console.log(squareRoot(9))
console.log(squareRoot(120))
console.log(squareRoot(490))
console.log(squareRoot(54))
console.log(squareRoot(90))