function factorial(aNumber){
    if(aNumber <= 1){
        return 1;
    }else{
        return aNumber * factorial(aNumber - 1);
    }
}