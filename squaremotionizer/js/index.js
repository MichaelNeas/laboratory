let square = document.getElementById('square');
let info = document.getElementById('info');
let magicbtn = document.getElementById('magic');
function trigger(){ 
  if(info.style.visibility === 'hidden'){
    info.style.visibility = 'initial';
    info.style.transform = 'translateX(150px)';
    magicbtn.style.transform = 'translateX(-150px)';
    square.style.transform = 'rotate(0deg) rotateZ(360deg)';
  }else{
    info.style.visibility = 'hidden';
    info.style.transform = 'translateX(0)';  
    magicbtn.style.transform = 'translateX(0)';
    square.style.transform = 'rotate(-360deg) rotateZ(-360deg)';
  }
}