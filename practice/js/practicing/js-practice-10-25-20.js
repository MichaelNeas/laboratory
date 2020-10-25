const https = require('https')

function read(book) {
	return function(page) {
		return `Page ${page} of ${book} talks about x,y,z`
	}
}

console.log(read("Factfulness")(4))


// {
//     "userId": 10,
//     "id": 200,
//     "title": "ipsam aperiam voluptates qui",
//     "completed": false
//   }
function doStuff(data) {
	let counter = (prev, curr) => {
		prev[curr.userId] = (prev[curr.userId] || 0) + 1;
		return prev
	}

	let usersCommentCount = data.reduce(counter, {})
	console.log(usersCommentCount)
	let notCompleted = data.filter(val => val.completed == false)
	console.log(notCompleted)

	let notCompletedComments = notCompleted.map(val => val.title)
	let ncUsers = Object.entries(notCompleted.reduce(counter, {}))
						.sort((a, b) => b[1] - a[1])
	console.log(ncUsers)
}

https.get('https://jsonplaceholder.typicode.com/todos', (resp) => {
  let data = '';

  // A chunk of data has been recieved.
  resp.on('data', (chunk) => {
    data += chunk;
  });

  // The whole response has been received. Print out the result.
  resp.on('end', () => doStuff(JSON.parse(data)))

}).on("error", (err) => {
  console.log("Error: " + err.message);
});