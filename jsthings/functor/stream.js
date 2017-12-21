//Stream of data with variables floating down, result of promise and array having a baby, a way of modeling a flow of values
const fs = require('fs') // nodestream
const highland = require('highland') //stream library

highland(fs.createReadStream('customers.csv', 'utf8'))
	.split()
	.map(line => line.split(','))
	.map(parts => ({
		name: parts[0],
		numPurchases: parts[1]
	}))
	.filter(customer => customer.numPurchases > 2)
	.map( customer => customer.name)
	.each(x => console.log('each: ', x))


const someNumberStream = {
	each: (callback) => {
		setTimeout(() => callback(1), 1000)
		setTimeout(() => callback(2), 2000)
		setTimeout(() => callback(3), 3000)
	}
}

someNumberStream.each(console.log)

/*
*	Bacon js is streaming library
*   Keep data a functions separate 
*/