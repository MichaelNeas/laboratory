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

let i;
for(i=0;i<50; i++){
    let randomNum1to1000 = Math.random() * (1000 - 1) * 100;
    console.log(`Difference for approximation of sqrt ${randomNum1to1000} ${squareRoot(randomNum1to1000) - Math.sqrt(randomNum1to1000)}`);
}