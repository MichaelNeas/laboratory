function createObservable(subscribe){
    return{
        subscribe: subscribe,
        map: map,
        filter: filter
    };
}

function map(transformFn){
    const inputObservable = this;
    const outputObservable = createObservable(function subscribe(outputObserver){
        inputObservable.subscribe({
            next: function(x) {
                const y = transformFn(x);
                outputObserver.next(y);
            },
            error: e => outputObserver.error(e),
            complete: () => outputObserver.complete(),
        })
    })
    return outputObservable;
}

function filter(conditionFn){
    const inputObservable = this;
    const outputObservable = createObservable(function subscribe(outputObserver){
        inputObservable.subscribe({
            next: function(x) {
                if(conditionFn(x)){
                    outputObserver.next(x);
                }
            },
            error: e => outputObserver.error(e),
            complete: () => outputObserver.complete(),
        })
    })
    return outputObservable;
}

const arrayObservable = createObservable(function subscribe(ob){
        [1,2,3].forEach(ob.next);
});

const clickObservable = createObservable(function subscribe(ob) {
        document.addEventListener('click', ob.next);
});

let observer = {
    next: function nextCallback(data){
        console.log(data);
    },
    error: function errorCallback(err){
        console.log(err)
    },
    complete: function completeCallback(){
        console.log('done');
    }
}

//all we have done is create an object that returns an object that contains methods
//subscribe is basically just saying "yo give me data"
arrayObservable
    .map(x => x/10)
    .filter(x => x !== .2)
    .subscribe(observer);

//observable is a way to get any callback and making that be a collection
//120 other operators outside map and filter
/*clickObservable
    .map(ev => ev.clientX)
    .filter(x => x < 200)
    .subscribe(observer);*/