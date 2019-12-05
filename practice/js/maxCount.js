let numbers = [3,4,5,5,9,10,10,14,14,14,14,14,14,14,14];

//numbers dont have to be sorted
let maxCount = numbers.reduce(function(prev, cur) {
	prev[cur] = (prev[cur] || 0) + 1;
	return prev;
}, {});

function iterateThrough(object){
	let max = 0;
	for (let key in object) {
		if (object.hasOwnProperty(key)) {
			if(object[key] > max){
				console.log('new max', key + " seen " + object[key] + " time(s)");
				max = object[key];
			}else{
				console.log(key + " seen " + object[key] + " time(s)");
			}
		}
	}
	return max;
}

console.log('Original array: ', numbers);
console.log('Reduced to: ', maxCount);
console.log('Max count: ', iterateThrough(maxCount));