/*Check if a string can be permutated to be a palindrom*/
function processData(input) {
    var totals={};
    input.split("").forEach(function(s){
        totals[s] ? totals[s]++: totals[s] = 1
    });
    /*map implementation
    input.split('').map(function(ch) {
        totals[ch] = (totals[ch] || 0) + 1;
    });*/
    var count=1;
    for (var char in totals) {
        if(totals[char]%2 !== 0 && count === 0){
            return "NO";
        }
        if(totals[char]%2 !== 0 && count === 1){
            count--;
        }
    }
    return "YES";
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