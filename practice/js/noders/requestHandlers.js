// Allows parsing of data
var querystring = require("querystring"), 
	fs = require("fs"),
	formidable = require("formidable");
/* request handlers, called functions when requests are routed to specific places
* DONT use return statements because we will run into problems if one the request 
* handlers wants to make use of a non-blocking operation in the future.
* If start returned something but needed 10ms to finish, upload would be forced to sit until then
* By accepting the response parameter we handle it 
* Now however by handling the response in each handler each will be answered immediately, even if /start is still computing.
* POST is nonblocking, which makes sense when posts can be so large
*/

//exec is a non blocking operation
var exec = require("child_process").exec;

let start = (response) => {
	console.log("Request handler 'start' was called.");
	//exec("ls -lah", (error, stdout, stderr) => { 
	let body = '<html>'+
	'<head>'+
	'<meta http-equiv="Content-Type" '+ 
	'content="text/html; charset=UTF-8" />'+
	'</head>'+
	'<body>'+
	'<form action="/upload" enctype="multipart/form-data" '+ 
	'method="post">'+
	'<input type="file" name="upload" multiple="multiple">'+ 
	'<input type="submit" value="Upload file" />'+
	'</form>'+
	'</body>'+
    '</html>';
	response.writeHead(200, {"Content-Type": "text/html"}); 
	response.write(body);
	response.end();
}

let upload = (response, request) => {
	console.log("Request handler 'upload' was called.");
	let form = new formidable.IncomingForm(); console.log("about to parse");
	form.parse(request, function(error, fields, files) {
	    console.log("parsing done");
	    /* Possible error on Windows systems:
	       tried to rename to an already existing file */
	fs.rename(files.upload.path, "./tmp/test.png", (err) => { 
			if (err) {
	        	fs.unlink("./tmp/test.png");
	        	fs.rename(files.upload.path, "./tmp/test.png");
	    	}
	    });
	    response.writeHead(200, {"Content-Type": "text/html"});
	    response.write("received image:<br/>");
	    response.write("<img src='/show' />");
	    response.end();
	});
}


let show = (response, postData) => {
	console.log("Request handler 'show' was called."); 
	fs.readFile("./tmp/test.png", "binary", (error, file) => {
		if(error) {
			response.writeHead(500, {"Content-Type": "text/plain"});
			response.write(error + "\n");
			response.end(); 
		} else {
	    	response.writeHead(200, {"Content-Type": "image/png"});
	    	response.write(file, "binary");
	    	response.end();
		} 
	});
}

exports.start = start;
exports.upload = upload;
exports.show = show;