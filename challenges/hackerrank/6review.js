function processData(input) {
    let puzzleArray = input.split("\n");
    let testCase = puzzleArray.splice(0,1);
    while(testCase > 0){
        let word = puzzleArray.splice(0,1).toString();
        let even = '';
        let odd = '';
        let i;
        for(i = 0; i<word.length; i++){
            if(i % 2 === 0){
                even += word.charAt(i);
            }else{
                odd += word.charAt(i);
            }
        }
        console.log(even + " " + odd);
        testCase--;
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
