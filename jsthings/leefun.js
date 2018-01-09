let A = [2,4,2,4,1,3,3];
console.log("Start with ", A);

let B = A.reduce((obj, val) => {
	val in obj ? obj[val]+=1 : obj[val]=1; 	
	return obj;
}, {});
console.log("Reduce to ", B);

let C = Object.keys(B).find(key => B[key] === 1);
console.log("Unique is ", C);


let D = A.reduce((acc, val) => {
	return acc ^ val;
}, 0);

console.log("unique is", D);
