(async function test(){ 
    await Promise.resolve().then(() => console.log('hey'));
    console.log('hi');
    Promise.resolve().then(() => console.log('bye'));
    console.log('bai');
})()