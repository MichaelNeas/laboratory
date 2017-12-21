let countDown = (n) => {
	if(n === 0) return;
	console.log(n);
	countDown(n-1);
}

countDown(10);

let peeps = [
	{id: 'people', parent: null},
	{id: 'friends', parent: 'people'},
	{id: 'family', parent: 'people'},
	{id: 'bestfriends', parent: 'friends'},
	{id: 'trevor', parent: 'bestfriends'},
	{id: 'scott', parent: 'friends'},
	{id: 'mia', parent: 'family'},
	{id: 'zach', parent: 'friends'},
]

/*
*	Filter out those with the same parent
*   For all the ones with the same parent you assign the property of the node with the same id from each data
*/
let makeTree = (data, parent) => {
	let node = {};
	data.filter(p => p.parent === parent)
		.forEach(p => node[p.id] = makeTree(peeps, p.id))
	return node;
}

console.log(JSON.stringify(makeTree(peeps, null),null,2));