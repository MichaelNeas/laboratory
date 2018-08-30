const events = require('events');
const util = require('util');

//create custom events not just like click
const myEmitter = new events.EventEmitter();

class Person {
  constructor(name){
    this.name = name;
  }
}


util.inherits(Person, events.EventEmitter);

const bill = new Person('bill');
const mike = new Person('mike');
const people = [bill, mike];

people.forEach(person => {
  person.on('speak', msg => console.log(person.name + ' said: ' + msg));
});

bill.emit('speak', 'hi bro');
mike.emit('speak', 'well hay there');


myEmitter.on('myEvent', msg => console.log(msg));

//emit the even we created and trigger callback function
myEmitter.emit('myEvent', 'hi');
