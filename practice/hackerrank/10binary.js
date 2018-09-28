process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();    
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

function main() {
    var n = parseInt(readLine());
    let base2 = n.toString(2);
    let consecutiveCount = 0;
    let tempCount = 0;
    let i;
    for(i = 0; i < base2.length; i++){
        base2.charAt(i) === '1' ? tempCount++ : tempCount = 0;
        
        if(consecutiveCount < tempCount){
            consecutiveCount = tempCount;
        }
    }
    console.log(consecutiveCount);
}
