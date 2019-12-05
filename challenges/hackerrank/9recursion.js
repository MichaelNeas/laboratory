function processData(input) {
    console.log(factorial(input));
} 
function factorial(aNumber){
    if(aNumber <= 1){
        return 1;
    }else{
        return aNumber * factorial(aNumber - 1);
    }
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
