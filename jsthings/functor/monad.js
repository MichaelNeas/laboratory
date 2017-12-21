//A functor implements map, a monad implements flatmap
const Bacon = require('baconjs')
const fetch = require('node-fetch')
const stream = new Bacon.Bus() //create a bus, most basic stream

stream
	.map(word => word.toUpperCase())
	.onValue(word => console.log(word));

stream.push('cat')//push words onto the stream
stream.push('fig')
stream.push('chocolate')

//flatmap flattens the streams to return the values within the stream and flatten the map

function getInPortuguese(word) {
  // Google Translate API is a paid (but dirt cheap) service. This is my key
  // and will be disabled by the time the video is out. To generate your own,
  // go here: https://cloud.google.com/translate/v2/getting_started
  const apiKey =
    'AIzaSyB4DyRHIsNhogQXmH16YKbZfR-lTXrQpq0'
	const url =
    'https://www.googleapis.com' +
    '/language/translate/v2' +
  	'?key=' + apiKey +
    '&source=en' +
    '&target=pt' +
    '&q=' + encodeURIComponent(word)
  const promise = fetch(url)
 		.then(response => response.json())
	  .then(parsedResponse =>
    	parsedResponse
      	.data
        .translations[0]
        .translatedText
    )
  const stream = Bacon.fromPromise(promise)
  return stream
}

stream
  .flatMap(word => getInPortuguese(word)) //compresses objects
  .map(word => word.toUpperCase())
  .onValue(word => console.log(word))

// Output of running this file will be:
// TROMBETA
// REFEIÇÃO
// GATO