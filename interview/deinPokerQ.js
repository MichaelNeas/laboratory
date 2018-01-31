ta = [[1,3,4,5],[10,4],[7,5],[10,10,10]]

const sumHands = (xs) => xs.reduce((acc, curr) => acc += curr , 0);
const findBusts = (x) => x > 21 ? -1 : x;

const BlackJack = (hands) => hands.map(sumHands).map(findBusts)

BlackJack(data) /*?*/
