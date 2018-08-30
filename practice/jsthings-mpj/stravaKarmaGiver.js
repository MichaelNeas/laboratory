//woops
setInterval(function(){
    window.scrollTo(0,document.body.scrollHeight);
    var elems = document.querySelectorAll('[title="Give Kudos"]');
    for(var z=0;z<elems.length;z++)
        elems[z].click();
},6000)