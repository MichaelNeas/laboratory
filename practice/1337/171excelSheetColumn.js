/**
 * @param {string} s
 * @return {number}
 */
let titleToNumber = s => [...s].reduce((prev, curr) => (prev * 26) + (curr.charCodeAt(0) - 64), 0);