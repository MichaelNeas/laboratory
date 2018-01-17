//Find the first non-repeated character in a String

const firstNonRepeated = str => {
    let i;
    for (i = 0; i < str.length; i++) {
        let c = str.charAt(i);
        if (str.indexOf(c) == i && str.indexOf(c, i + 1) == -1) 
            return c;
    }
    return null;
}

console.log(firstNonRepeated('iiiiikdjskjsbafkekjsbnfiusajuwebhfcysudsaifvsafdoas'))