// server module

// http,url module ships out with node
var http = require('http');
var url = require('url');

/*
* createServer comes from module and requires a anonymous function of request and response 
* Request and Response are objects to handle the details of http request
*   - when a request is received we respond by writing to the HTTP response header and body and finish with end
* returns: object with a method listen set to port 8000
* Node.js, introduces the concept of event-driven, asynchronous callbacks, by utilizing an event loop.
* Php would create separate processes but js doesnt 
* Wrap in a start function to be used with other modules requiring this one
* Adding in pathname allows the application to recognize paths from url
* Inject route as a parameter to allow loose coupling
* Handle is injected to handle various endpoints in router
* Response is then injected to allow the server to go to the content rather than content go to server
* Add listeners to request objects, data and end event callbacks in the server, collecting all POST data 
* chunks in the data callback, and calling the router upon receiving the end event, while passing the collected 
* data chunks on to the router, which in turn passes it on to the request handlers.
*	1. Expect utf8 from the received data
*	2. Pass post data to the route data for request handlers
*/
let start = (route, handle) =>{
	let onRequest = (request, response) => { 
		let pathname = url.parse(request.url).pathname; 
		console.log("Request for " + pathname + " received.");
		route(handle, pathname, response, request);

		/*request.setEncoding("utf8");

		request.addListener("data", postDataChunk => { 
			postData += postDataChunk;
			console.log("Received POST data chunk '"+ postDataChunk + "'.");
		});

		request.addListener("end", function() { 
			route(handle, pathname, response, postData);
		});*/
	}
	http.createServer(onRequest).listen(8000);
	console.log('Server has started');
}

//export certain functionality to be usable elsewhere
exports.start = start;