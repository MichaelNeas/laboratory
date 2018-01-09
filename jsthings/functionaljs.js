var friends = [
	{ Name : 'Dan'  ,  fav : 'js'     , age : 24},
	{ Name : 'Joey' ,  fav : 'swift'  , age : 22},
	{ Name : 'Ted'  ,  fav : 'android', age : 22},
	{ Name : 'Ant'  ,  fav : 'c'      , age : 22},
	{ Name : 'Jacky',  fav : 'java'   , age : 22},
	{ Name : 'Bob'  ,  fav : 'SQL'    , age : 23},
	{ Name : 'Alex' ,  fav : 'java'   , age : 24}  
];

//expected true or false eval
var javalovers = friends.filter((friend) => friend.fav === 'java');

console.log(javalovers);

//expects transformed object
var names = friends.map((friend) => friend.Name);

//gives you all the names
console.log(names);

//reduce takes a function and an object
var avgAge = friends.reduce((sum, friend) => sum + friend.age, 0)/(friends.length||1);

console.log(avgAge + ' is the average age of my friends');

var friendsByFav = friends.reduce((friends, friend) => {
	friends[friend.fav] = friends[friend.fav] || [];
	friends[friend.fav].push({
		name: friend.Name,
		age: friend.age
	})
	return friends;
}, {})

console.log(JSON.stringify(friendsByFav, null, 2));
console.log('------------------');
console.log(friends);

//Swap case using map
function swapCase(text) {
	var letterArr = text.split('')
	var caseToggled = letterArr.map( toggleLetterCase)
	var joinString = caseToggled.join("")
	return joinString
}

function toggleLetterCase(e){
    return (e === e.toUpperCase()) ? e.toLowerCase() : e.toUpperCase()
}

function mapFilterIntDivideBigInt(n){
	return n.split("").map(Number).filter((integr)=>divideBy % integr === 0);
}

var maxArray = [7,213,2,12,-3,0,-1,39423,23,1235,23,123123,5,34,4,5,123,1312,31];

//Find maximum
var maxNum = maxArray.reduce(findMaximum,Number.MIN_VALUE);

function findMaximum(num, current){
	if(num >= current){
		return num;
	}else{
		return current;
	}
}

console.log(maxNum);

let sortAsc = (a,b) => {
	return a-b;
}

let sortDifferently = (a, b) => {
	if(a === b) return 0;
	if(a > b){
		return 1
	}else{
		return -1
	}
}

console.log(maxArray.sort(sortAsc))
console.log(maxArray.sort(sortDifferently))

//sort object
var maxSpeed = {
    car:300, bike:60, motorbike:200, airplane:1000,
    helicopter:400, rocket:8*60*60
}
var sortable = [];
for (var vehicle in maxSpeed)
      sortable.push([vehicle, maxSpeed[vehicle]])
sortable.sort(
    function(a, b) {
        return a[1] - b[1]
    }
)
//[["bike", 60], ["motorbike", 200], ["car", 300],
//["helicopter", 400], ["airplane", 1000], ["rocket", 28800]]

//object to array
var obj = {1: 11, 2: 22};
var arr = Object.keys(obj).map(function (key) { return obj[key]; });
//Object.keys(obj).map(key => obj[key])

//array to object
let arrayToObject = maxArray.reduce(function(o, v, i) {
  o[i] = v;
  return o;
}, {});

console.log(arrayToObject);

//Currying
let dragon =
	name =>
		size =>
			element =>
				name + ' is a ' + size + ' dragon that breathes ' + element + '!'

let output = dragon('Sisious')('giant')('fire')

console.log(output);







