/*Promises are composible so they are more powerful than basic callbacks
*	They are easy ways to conduct asyn code
*/
function loadImage(url){
	return new Promise((resolve,reject) => {
		let image = new Image();

		image.onload = function(){
			resolve(image)
		}

		image.onerror = function() {
			let message = 
				'Could no load image ' + url;
			reject(new Error(msg))
		}

		iamge.src = url
	})
}

expor default loadImage