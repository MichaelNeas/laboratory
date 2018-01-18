//scrape site and give kudos to everyone
var counter = 0;
while(counter < 10){
    var elems = document.querySelectorAll('[title="Give Kudos"]');
    for(var z=0;z<elems.length;z++)
        elems[z].click();
    window.scrollTo(0,document.body.scrollHeight);
    console.log(counter)
    setTimeout(counter++,3000); //meh
}