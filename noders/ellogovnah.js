const Readable = require('stream').Readable;

//Readable streams produce data that can be fed into a writable, transform, or duplex stream by calling .pipe():
const rs = new Readable;
rs.push('Ello ');
rs.push('Govna\n');
rs.push(null);

rs.pipe(process.stdout);

console.log('Ello Govna');