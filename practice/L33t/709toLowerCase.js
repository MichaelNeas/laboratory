// to lowercase


/**
 * @param {string} str
 * @return {string}
 */
var toLowerCase = function(str) {
    return str.toLowerCase()
};

//regex solution
// The test() method executes a search for a match between a regular expression and a specified string. Returns true or false.
const toLowerCase = (str) => {
    let lower = '';
    for (let char of str) {
      lower += /[A-Z]/g.test(char) ? String.fromCharCode(char.charCodeAt(0) + 32) : char;
    }
    return lower;
  };