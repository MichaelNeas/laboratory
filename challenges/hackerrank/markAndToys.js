function processData(input) {
    var outArray = input.replace( /\n/g, " " ).split(" ").map(Number);
    //console.log(outArray);
    let n = outArray[0];
    let k = outArray[1];
    let rest = outArray.slice(2,outArray.length);
    rest.sort(sortNumber);
    //console.log(rest);
    let total = 0;
    
    for(var i=0;i<rest.length;i++){
        if(k-rest[i]<0){
            return total;
        }else{
            k = k-rest[i];
            total++;
        }
    }
    
} 

function sortNumber(a,b) {
    return a - b;
}


process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
   console.log(processData(_input));
});
