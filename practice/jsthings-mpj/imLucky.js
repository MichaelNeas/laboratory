let me = {
	'5'  : "I",
	'10' : "'",
	'15' : "M",
	'20' : "L",
	'25' : "U",
	'30' : "C",
	'35' : "K",
	'40' : "Y"
}

let bc = "I can write code every day for a living and actually make money off of something I love.";

let i;
let what = '';
for(i = 5; i <= 40; i += 5){
	what += me[i];
}
console.log(what, bc);