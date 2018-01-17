//Determine if 2 Strings are anagrams

const areAnagrams = (str1, str2) => {
    if(str1.length != str2.length)
        return false;
    let i,j;
    let str2Arr = str2.split("");
    outer: for(i=0;i<str1.length;i++){
        inner: for(j=0; j<str2Arr.length; j++){
            if(str1.charAt(i) === str2Arr[j]){
                str2Arr.splice(i,1);
                break outer;
            }
        }
        return false;
    }
    return true;
}

const areAnagramsSorted = (str1, str2) => {
    if(str1.length != str2.length)
        return false;
    const str1Sorted = [...str1].sort();
    const str2Sorted = [...str2].sort();
    let i;
    for(i=0; i<str1.length; i++){
        if(str1Sorted[i] != str2Sorted[i])
            return false;
    }
    return true;
}

console.log(areAnagrams('mike', 'iekm'));
console.log(areAnagrams('miksadfsade', 'iekfasdfasdm'));
console.log(areAnagrams('mi ke', 'i ekm'));
console.log(areAnagrams('miplmoknke', 'ieplmoknkm'));
console.log(areAnagrams('miplmoknke', 'ieplmoknsafsadkm'));
console.log(areAnagramsSorted('mike', 'iekm'));
console.log(areAnagramsSorted('miksadfsade', 'iekfasdfasdm'));
console.log(areAnagramsSorted('mi ke', 'i ekm'));
console.log(areAnagramsSorted('miplmoknke', 'ieplmoknkm'));
console.log(areAnagramsSorted('miplmoknke', 'ieplmoknsafsadkm'));