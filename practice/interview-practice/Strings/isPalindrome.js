//Check if String is a palindrome

const isPalindrome = str => {
    str = str.toLowerCase().replace(/\s/g, "");
    let i;
    for(i = 0; i<str.length/2;i++){
        if(str.charAt(i) != str.charAt(str.length - (i + 1)))
            return false
    }
    return true;
}

console.log(isPalindrome('mikeekim'))
console.log('----')
console.log(isPalindrome('smaaiaams'))
console.log('----')
console.log(isPalindrome('smaaizaams'))
console.log('----')
console.log(isPalindrome('smaazzizaams'))
console.log('----')
console.log(isPalindrome('Able was I ere I saw Elba'));