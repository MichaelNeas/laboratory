let cbox = document.getElementById('crazyBox');
let base = 0;

function clicked(){
  cbox.style.backgroundColor = "red";
}

function heyYou(){
  cbox.style.backgroundColor = "cyan";
}

function notSoFast(){
  cbox.style.backgroundColor = "blue";
}

document.onkeydown = function pressMe(){
  cbox.style.backgroundColor = "orange";
}

function changeAddition(){
  base++;
  cbox.innerHTML = base+'';
}

document.onload = function log(){
  console.log('loaded');
}