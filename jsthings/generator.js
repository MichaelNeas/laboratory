const fetch = require('node-fetch');
const co = require('co');

const url = 'http://jsonplaceholder.typicode.com/posts/1';
//standard async using promises
fetch(url)
	.then(res => res.json())
	.then(post => post.title);

/*co takes a generator function
* When generator reaches yield, it takes the promise and yields it to co to deal with it
* Co resolves the promise and passes that back into the generator function
* Generator assigns to variables
*/
co(function *(){
	const response = yield fetch(url); //gives you the actual response body
	const post = yield response.json(); //another promise
	const title = post.title;
	console.log('co response title: ', title);
})

/*
* Making our own 'co', generator function
* We call runGenerator and it is passed a generator function
*/
runGenerator(function *(){
	const response = yield fetch(url); 
	const post = yield response.json(); 
	const title = post.title;
	console.log(title);
})

/*
* running generator gives an iterator
* This is going to call generator, it does not run it returns an iterator
* we call next() to instruct the iterator to run 
* 
*/
function runGenerator(generator){
	const iterator = generator();
	const iteration = iterator.next(); //start execution of generator
	const promise = iteration.value;
	promise
		.then(res => {
			const anotherIterator = iterator.next(res);
			const anotherPromise = anotherIterator.value;
			anotherPromise
				.then(resp => iterator.next(resp))
		})
}

/**mdn generators */
function* idMaker() {
	var index = 0;
	while(true)
		yield index++;
}

const gen = idMaker();

console.log(gen.next().value); // 0
console.log(gen.next().value); // 1
console.log(gen.next().value); // 2