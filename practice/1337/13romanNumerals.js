/**
I             1
V             5
X             10
L             50
C             100
D             500
M             1000

    I can be placed before V (5) and X (10) to make 4 and 9. 
    X can be placed before L (50) and C (100) to make 40 and 90. 
    C can be placed before D (500) and M (1000) to make 400 and 900.

 * @param {string} s
 * @return {number}
 */
var romanToInt = function(s) {
    let sum = 0
    for(let i=0; i<s.length; i++){
        switch(s.charAt(i)){
            case 'I':
                if(s.charAt(i+1)==='V'){
                    sum+=4
                    i+=1
                }else if(s.charAt(i+1)==='X'){
                    sum+=9
                    i+=1
                }else{
                    sum+=1
                }
                break
            case 'X':
                if(s.charAt(i+1)==='L'){
                    sum+=40
                    i+=1
                }else if(s.charAt(i+1)==='C'){
                    sum+=90
                    i+=1
                }else{
                    sum+=10
                }
                break
            case 'C':
                if(s.charAt(i+1)==='D'){
                    sum+=400
                    i+=1
                }else if(s.charAt(i+1)==='M'){
                    sum+=900
                    i+=1
                }else{
                    sum+=100
                }
                break
            case 'V':
                sum+=5
                break
            case 'L':
                sum+=50
                break
            case 'D':
                sum+=500
                break
            case 'M':
                sum+=1000
                break
        }
    }
    return sum
};


// Dope sol
var romanToInt = function(s) {
    const map = {
        I: 1,
        V: 5,
        X: 10,
        L: 50,
        C: 100,
        D: 500,
        M: 1000
    };
    let i = s.length;
    let result = 0;
    
    while (i--) {
        const curr = map[s.charAt(i)];
        const prev = map[s.charAt(i - 1)];
        
        result += curr; 
        
        if (prev < curr) {
            result -= prev; 
            i -= 1;
        }
    }
    
    return result;
};