const url = 'https://demo8429909.mockable.io/animals';

let animals = [];
$.get(url, function(data, status){
    animals = data;
    //console.log(animals);
  });

const DATA = [
  {
    id: 7,
    type: 1,  // cat
    name: 'Fluffy',
    trainable: false,
    birthDate: '5/7/05',
  },
  {
    id: 8,
    type: 2,  // dog
    name: 'Spot',
    trainable: true,
    birthDate: "\/Date(1336460400000)\/",
    adoptionDate: '2012-11-23T00:00:00-08:00',
  },
  {
    id: 9,
    type: 1,
    name: 'Boris',
    trainable: false,
    birthDate: '',
    adoptionDate: '2014-06-09T07:00:00Z'
  }
];

//dogObj date is not valid!
let dogObj = {
    id: 8,
    type: 2,  
    name: 'Spot',
    trainable: true,
    birthDate: "\/Date(1336460400000)\/",
    adoptionDate: '2012-11-23T00:00:00-08:00',
    speak: 'woof'
  }

//Prototype Animal
function Animal(animalObject){
  this.type = animalObject.type;
  this.isAdopted = function() {
    return animalObject.adoptionDate ? true : false;
  }
  this.age = function(){
    //INVALID DATE FORMAT
    let bday = new Date(animalObject.birthDate);
    console.log(bday);
    let fakebday = new Date('10-10-2010')
    let today = new Date();
    return monthsOld(fakebday,today) + ' months old';
  }
  this.trainable = animalObject.trainable;
  this.speak = function(){
    return this.trainable ? animalObject.speak : 'Cant speak';
  }
  this.adopted = animalObject.adoptionDate;
  this.adopt = function(){
    this.adopted === undefined ? this.adopted = new Date() : 'Cant adopt'  
  }
}

//months old gotten online from stack overflow
function monthsOld(d1, d2){
    var months;
    months = (d2.getFullYear() - d1.getFullYear()) * 12;
    months -= d1.getMonth() + 1;
    months += d2.getMonth();
    return months <= 0 ? 0 : months;
}

let dog = new Animal(dogObj);

console.log(dog);

//Generate a list of adopted cats' names.
let catNames = DATA.filter(catNamesAdopted)
                   .map(object => object.name);
  
function catNamesAdopted(element){
  if(element.type === 1 && element.adoptionDate){
    return element;
  }
}

console.log(catNames);