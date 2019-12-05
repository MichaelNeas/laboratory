//composition(what they are) > Inheritence(what they do)
//Specific functions get Object assigned and can all be accessed 
const barker = (state) => ({
	bark: () => console.log('Woof, I am ' + state.name)
})

const driver = (state) => ({
	drive: () => state.position = state.position + state.speed
})

const killer = (state) => ({
	kill: () => console.log('die')
})

const murderRobotDog = (name) => {
	//create state object with default object
	let state = {
		name,
		speed: 100,
		position: 0
	}
	//object assign will take an object and assigns the properties from other objects into it
	return Object.assign(
		{},
		barker(state),
		driver(state),
		killer(state)
	)
}

//Passes aicko object to the function bark;
barker({name: 'Aicko'}).bark()

let fenway = murderRobotDog('Fenway')

fenway.bark()
console.log(fenway.drive())