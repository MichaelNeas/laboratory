/*  Use dynamic programming to find the first X prime numbers
*       Eratosthenes
*   1. Create a list of consecutive integers from 2 through n: (2, 3, 4, ..., n).
*   2. Initially, let p equal 2, the smallest prime number.
*   3. Enumerate the multiples of p by counting to n from 2p in increments of p, and mark them in the list (these will be 2p, 3p, 4p, ...; the p itself should not be marked).
*   4. Find the first number greater than p in the list that is not marked. If there was no such number, stop. Otherwise, let p now equal this new number (which is the next prime), and repeat from step 3.
*   5. When the algorithm terminates, the numbers remaining not marked in the list are all the primes below n.
*/

(function firstXPrimes(X){
    let possibleValuesTable = ["X","X"];
    let ans = [];
    let i;
    for(i = 2; i<X; i++){
        if(possibleValuesTable[i] !== "X"){
            possibleValuesTable[i] = i;
            ans.push(i);
            for(j=i+i; j<X; j+=i)
                possibleValuesTable[j] = "X";
        }
    }
    //console.log(possibleValuesTable)
    return ans;
})(30);

/*
    1 2  3  4  5  6  7
1   1 2  3  4  5  6  7
2   2 4  6  8  10 12 14
3   3 6  9  12 15 18 21
4   4 8  12 16 20 24 28
5   5 10 15 20 25 30 35
6   6 12 18 24 30 36 42 
7   7 14 21 28 35 42 49
*/