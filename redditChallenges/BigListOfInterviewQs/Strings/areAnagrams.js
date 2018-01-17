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

console.log(areAnagrams('mike', 'iekm'));
console.log(areAnagrams('miksadfsade', 'iekfasdfasdm'));
console.log(areAnagrams('mi ke', 'i ekm'));
console.log(areAnagrams('miplmoknke', 'ieplmoknkm'));
console.log(areAnagrams('miplmoknke', 'ieplmoknsafsadkm'));