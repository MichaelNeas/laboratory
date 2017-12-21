let daBox = document.getElementById('box');
function nameMikesBox(){
  daBox.innerHTML = "Mike's box";
  daBox.style.border = "solid";
  daBox.style.width = "10%";
  daBox.style.backgroundColor = "tomato";
}

function notMikesBox(){
  daBox.style.display = "block";
  daBox.innerHTML = "Scott's Box";
  daBox.style.backgroundColor = "aquamarine";
  daBox.style.width = "95%";
  daBox.style.border = "none";
}

function noOnesButton(){
  daBox.style.display = "none";
}

function alertButton(){
  window.alert(daBox.innerHTML);
  console.log('triggered alert!');
  var name = "neas";
  var name;
  
  
  console.log(name);
}

//document.write rewrites DOM
// instanceof, LHS is evaluated to the RHS

var acolor = new String('green');
console.log(acolor instanceof String);//true
var bcolor = 'green';
console.log(bcolor instanceof String);//false
console.log(typeof acolor + ' : ' + typeof bcolor);//object : string