const http = require('http');
const fs = require('fs');
// const stuff = require('./module');




// const server = http.createServer((req, res) => {
//   console.log('request made:', req.url);
//   res.writeHead(200, {'Content-Type': 'text/plain'});
//   res.end('hioi');
// });

// server.listen(3000, '127.0.0.1');

//delete a file, will throw error if does not exist
//fs.unlink('writeme.txt');

//directories
//sync create and delete
//fs.mkdirSync('stuff');
//fs.rmdirSync('stuff');

//fs.mkdir('stuff', () => fs.readFile('readme.txt', 'utf8', (err, data) => fs.writeFile('./stuff/writeMe.txt', data)));
//can't remove directory with stuff in it

//delete whatevers in then delete the dir
//fs.unlink('./stuff/writeMe.txt', () => fs.rmdir('stuff'));

//fs.readdir('stuff', (err, data) => console.log(data.length));

//sync
// const readMe = fs.readFileSync('readme.txt', 'utf8');
// fs.writeFileSync('writeSync.txt', readMe);

// async 
//fs.readFile('readme.txt', 'utf8', (err,data) => fs.writeFile('writeAsync.txt', data));

// console.log(stuff);
// console.log(__dirname, __filename);
// console.log(stuff.adder(2,3));
// console.log(stuff.count([1,2,3,4,5]));
// console.log(stuff.bleh(2));

//function statement/declaration
//function statement(name){return name;}

//function expression
//let expression = name => name;

// let time = 0;
// const timer = setInterval(() => {
//   time += 2;
//   console.log(time + ' seconds have passed');
//   if(time > 5){
//     clearInterval(timer);
//   }
// }, 2000);

// const myWriteStream = fs.createWriteStream(__dirname + '/writeme.txt');
// myReadStream.on('data', chunk => {
//     console.log(chunk, ' = chunk received');
//     myWriteStream.write(chunk);
// });

// const server = http.createServer((req, res) => {
//   console.log('Request was made: ' + req.url);
//   res.writeHead(200, {'Content-Type': 'text/html'});
//   const myReadStream = fs.createReadStream(__dirname + '/index.html', 'utf8');
//   myReadStream.pipe(res);
// });

//json
const server = http.createServer((req, res) => {
  console.log('Request was made: ' + req.url);
  if(req.url === '/home'){
    res.writeHead(200, {'Content-Type': 'text/html'});
    fs.createReadStream(__dirname + '/index.html').pipe(res);
  }else{
    res.writeHead(404, {'Content-Type': 'application/json'});
    res.end(JSON.stringify({name:'mike', status: 'working', age: 27}));
  }
});


server.listen(3000, '127.0.0.1');
console.log('listening on 3000');