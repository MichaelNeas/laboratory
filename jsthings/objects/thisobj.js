/* 'this' in js has the same inference of infering from context
* without context 'this' will generally refer to the window or global
* Functions are just values that live on there own and 'this' is determined at the time of the call
*/
let talk = function(){
	console.log(this.sound);
}

let mia = {
	sound: 'hai, i play soccer and stuff'
}

//bind creates a new copy of talk but it has a 'bind' to mia always
mia.speak = talk.bind(mia);

// bind does not mess with the talk function
let talkBoundToMia = talk.bind(mia); 
talkBoundToMia()

// js can infer 'this' is mia, calling as propertiy on mia object
mia.speak() 
talk() // undefined

let blabb = mia.speak;
blabb();

let carol = {
	blabber: talk,
	sound: 'i painted it'
}

let mike = {
	jabber: carol.blabber,
	sound: 'i ladder\'d it'
}

mike.jabber() 