//Given a function rand5() that returns a random int between 0 and 5, implement rand7()

let rand5 = () => Math.floor(Math.random() * 20);

let rand7 = () => (rand5() + rand5() + rand5() + rand5() + rand5() + rand5() + rand5()) % 7;

let i;
let resultObj = {};
for(i=0;i<1000; i++){
    let temp = rand7();
    if(resultObj[temp])
        resultObj[temp] = resultObj[temp] + 1;
    else 
        resultObj[temp] = 1;
}

//pretty decent distribution imo
console.log(JSON.stringify(resultObj));