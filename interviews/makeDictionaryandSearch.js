function makeDictionary(input) {
    let inputArray = input.split('\n');
    let dictionaryEntries = inputArray.splice(0,1);
    dictionaryEntries = parseInt(dictionaryEntries);
    let dictionary = {};
    let i;
    for(i = 0; i < dictionaryEntries; i++){
        let temp = inputArray[i].split(' ');
        let key = temp[0];
        let value = temp[1];
        dictionary[key] = value;
    }
    inputArray.splice(0,i);
    searchDictionary(array, dictionary);
} 

function searchDictionary(array, dictionary){
    let j;
    for(j = 0; j<inputArray.length; j++){
        let checkKey = inputArray[j].toString();
        if (checkKey in dictionary){
            console.log(checkKey + '=' + dictionary[checkKey]);
        }else{
            console.log('Not found');
        }
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