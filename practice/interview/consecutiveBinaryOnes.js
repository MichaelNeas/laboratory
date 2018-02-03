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
