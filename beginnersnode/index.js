//main file

// server and router are now bffls and work with eachother
var server = require("./server"); 
var router = require("./router");
var requestHandlers = require("./requestHandlers");

//objects in js can be used as "associative arrays", aka key value pairs
var handle = {}
handle["/"] = requestHandlers.start; 
handle["/start"] = requestHandlers.start;
handle["/upload"] = requestHandlers.upload;
handle["/show"] = requestHandlers.show;

//http server makes use of router and passes url
server.start(router.route, handle);