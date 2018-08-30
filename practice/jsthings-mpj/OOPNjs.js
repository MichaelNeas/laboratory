	/*
 * Person Object
 */
	// Constructor
	var Person = function(name, age){
		this.name = name;
		this.age = age;
		this.friends = [];
	};

	// Methods
	Person.prototype.greet = function(){
		console.log(this.name + " " + this.age);
	};

	Person.prototype.addFriend = function(person){
		if(typeof(person) === 'object'){
			this.friends.push(person);
		}else{
			console.log("TypeError");
		}
	}

	Person.prototype.friendsWith = function(){
		for(var i = 0; i < this.friends.length; i++){
			this.friends[i].greet();
		}
	}


	/*
	 * Main Method 
	 */
	Dan = new Person("Dan", 25);

	Mike = new Person("Mike", 24);
	Joey = new Person("Joey", 22);

	Dan.addFriend(Mike);
	Dan.addFriend(Joey);

	console.log("Hello I am: ");
	Dan.greet();
	console.log('\n');
	console.log("And I am friends with: ");
	Dan.friendsWith();

