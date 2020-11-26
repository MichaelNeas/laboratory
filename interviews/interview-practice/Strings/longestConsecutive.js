// Find the longest consecutive character in a string

let consecutiveCharFinder = str => {
    let mostConsecutiveChar = "";
    let mostConsecutiveCount = 0;
    let currentCount = 1;
    for(let i = 0; i<str.length-1; i++){
        if(str.charAt(i) === str.charAt(i + 1)){
            currentCount++
        }else{
            if(currentCount > mostConsecutiveCount){
                mostConsecutiveChar = str.charAt(i)
                mostConsecutiveCount = currentCount
            }
            currentCount = 1;
        }
    }
    return {[mostConsecutiveChar]:mostConsecutiveCount}
}

console.log(consecutiveCharFinder("aosidnosidnfoidfidjfjdijjfjjjfdifjodisjaoijfsfoasidfjasffddffffdfddsadfsds afsdaoifnosif"))

let consecutiveCharCounterLockerUpper = str => {
    let finalMap = new Map();
    [...str].reduce((prev, curr, i, arr) => {
        if(prev[curr] === undefined){
            let holder = Object.keys(prev)[0]
            if(finalMap.get(holder) === undefined || finalMap.get(holder) < prev[holder])
                finalMap.set(holder, prev[holder])
        } else {
            prev[curr]++
            return prev
        }
        return {[curr]:1}
    }, {})
    let getHighest = () => {
        let highestBidder = ""
        let highestAmount = 0
        finalMap.forEach((val, key) => {
            if(val > highestAmount) {
                highestAmount = val
                highestBidder = key
            }
        })
        return {[highestBidder]:highestAmount}
    }
    return {
            alphabeticalMap: [...finalMap].sort(),
            orderedMap: new Map([...finalMap.entries()].sort((a, b) => a[1] - b[1])),
            getHighest: getHighest
        }
}

console.log(consecutiveCharCounterLockerUpper("oidasnfoisnfoidsnfindofnnfiniodsnfoijfiosdajfoijjoifhohhhhiodshfoiasdhfoihweoiehweoirioruijjieirrir").getHighest())
console.log(consecutiveCharCounterLockerUpper("oidasnfoisnfoidsnfindofnnfiniodsnfoijfiosdajfoijjoifhohhhhiodshfoiasdhfoihweoiehweoirioruijjieirrir").alphabeticalMap)
console.log(consecutiveCharCounterLockerUpper("oidasnfoisnfoidsnfindofnnfiniodsnfoijfiosdajfoijjoifhohhhhiodshfoiasdhfoihweoiehweoirioruijjieirrir").orderedMap)