// curry with bind
function message1(msg) {
    console.log(this.name + ': ' + msg);
}
//returns message 1 function with name bound
function message1Who(name) {
    this.name = name;
    return message1.bind(this);
}
//establishes the name, curries up the message
let message1Steph = message1Who('steph')('shoot that 3');

// normal curry
let message2 = name => msg => console.log(name + ': ' + msg);
let message2Steph = message2('steph');
message2Steph('shake and bake');

// factory
const Messenger = function(state) {
    return {
        send: msg => console.log(state.name + '! ' + msg)
    };
};

const Player1 = name => {
    //sorry, #noclassnostate
    let state = {
        name: name
    };
    return Object.assign(
        {},
        Messenger(state)
    );
};

let message3Steph = Player1('Steph');
message3Steph.send('that drop');


// class
function Player2(name) {
    this.name = name;
}

let proto = Player2.prototype;
proto.send = function(msg) {
    console.log(this.name + ': ' + msg);
}
const message4Steph = new Player2('Steph');
message4Steph.send('You can\'t do that to them!');