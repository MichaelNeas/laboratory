function processData(input) {
    let data = input.split("\n");
    let mealCost = parseFloat(data[0]);
    let tip = parseInt(data[1]);
    let tax = parseInt(data[2]);
    tip = (tip/100) * mealCost;
    tax = (tax/100) * mealCost;
    mealCost = Math.round(mealCost + tip + tax);
    console.log('The total meal cost is ' + mealCost + ' dollars.');
} 

process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
   processData(_input);
});
