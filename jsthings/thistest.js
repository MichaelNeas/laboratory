
global.a = 1
function foo(){
    console.log(this.a)
}

const bar = () => {
    return {
        a: 3,
        go: function(){
            console.log(this.a)
        }
    }
}
foo()
bar().go();