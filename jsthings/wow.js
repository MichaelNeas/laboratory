//neato javascript
console.log((function myFunc(cl) {
    var x = 0;
    cl(x += 1, x += 999.5 | 0,x);
    return(x += 1, x += 999.5 | 0,x);
})(console.log))