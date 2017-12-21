/* routing endpoints
* The url module provides methods which allow us to extract the different parts of a URL 
* (like e.g. the requested path and query string)
* querystring can in turn be used to parse the query string for request parameters
*/


/*
* Check if pathname exists and if it does, then execute teh function in pathname
* handle[pathname]();  is a fancy way to execute a function in associative array
* response now handles inside requesthandlers
*/
let route = (handle, pathname, response, request) => { 
	console.log("About to route a request for " + pathname); 
	if (typeof handle[pathname] === 'function') {
		handle[pathname](response, request); 
	} else {
	    console.log("No request handler found for " + pathname);
	    response.writeHead(404, {"Content-Type": "text/html"});
	    response.write("404 Not found");
	    response.end();
	} 
}

exports.route = route;