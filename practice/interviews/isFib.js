function processData(input) {
    let inputArray = input.split("\n");
    inputArray.shift();
    
    inputArray.forEach((element)=>{
        let total = 0;
        let temp = 0;
        let temp2 = 1;
        while(total <= element){
            if(element == total){
                console.log('IsFibo');
                return;
            }else{
                total = temp + temp2;
                temp = temp2;
                temp2 = total;
            }
        }
        console.log('IsNotFibo');
    })
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
