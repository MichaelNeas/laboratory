//Find the first reoccuring character in a string

let firstReoccuring = str => {
    let found = 0;
    [...str].reduce((prev, curr, i) => {
        if(prev[curr] === 1 && found === 0)
            found = curr
        prev[curr] = 1
        return prev;
    }, {})
    return found
}


console.log(firstReoccuring("aspdfnasdpinfoisadnfoinasoifnasoinfdoasndfoi"))
console.log(firstReoccuring("aspofmPOsmfopmwrofmdspafona"))

let firstReoccuringWithGenerallyBetterPerformance = str => {
    let dict = {}
    for(let i = 0; i < str.length; i++){
        let char = str.charAt(i)
        if(dict[char] === undefined){
            dict[char] = 1
        } else {
            //return breaks the loop
            return char
        }
    }
    return 0
}

console.log(firstReoccuringWithGenerallyBetterPerformance("aspdfnasdpinfoisadnfoinasoifnasoinfdoasndfoi"))
console.log(firstReoccuringWithGenerallyBetterPerformance("aspofmPOsmfopmwrofmdspafona"))