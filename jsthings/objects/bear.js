function Bear(type){
	this.type = type;
}

Bear.prototype.growl = function(){
	console.log(this.type + ' bear says grr');
}

function Grizzly(){
	Bear.call(this, 'grizzly')
}

Grizzly.prototype = Object.create(Bear.prototype)

let grizzly = new Grizzly()
let polar = new Bear('polar')

console.log(grizzly.growl())