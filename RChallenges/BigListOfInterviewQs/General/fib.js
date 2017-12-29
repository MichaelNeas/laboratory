//Write fibbonaci iteratively and recursively (bonus: use dynamic programming) 

(function fib(n){
    let i, a = 0; b = 1, total = 0;
    if(n<=1)
        total = n;

    for(i = 1; i < n; i++){    
        total = a + b;
        console.log(total)
        a = b;
        b = total;
    }
    console.log(`Fib of ${n} iteratively is ${total}`);

    let recursiveFib = n => {
        if(n <= 1)
            return n
        else    
            return recursiveFib(n-1) + recursiveFib(n-2);
    }
    
    let recursiveTotal = recursiveFib(n);
    console.log(`Fib of ${n} recursively is ${recursiveTotal}`);

    let cache = [0,1];
    let memoizedFib = n => {
        if(cache[n])
            return cache[n];
        
        if(n < 1)
            return 0;
        
        return cache[n] = memoizedFib(n-1) + memoizedFib(n-2);
    }
    let memTotal = memoizedFib(n);
    //console.log(cache);
    console.log(`Fib of ${n} memoized is ${memTotal}`);
})(15);