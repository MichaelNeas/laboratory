/**
 * Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.
 * The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle. 
 * @param {string} moves
 * @return {boolean}
 */
var judgeCircle = function(moves) {
    let collection = new Map([["L", 0], ["R", 0], ["U", 0], ["D", 0]]);
    for(let i=0; i<moves.length; i++){
        switch (moves[i]){
            case 'L':
                collection.set("L", collection.get("L") + 1)
                break;
            case 'R':
                collection.set("R", collection.get("R") + 1)
                break;
            case 'U':
                collection.set("U", collection.get("U") + 1)
                break;
            case 'D':
                collection.set("D", collection.get("D") + 1)
                break;
        }
    }
    return collection.get("L") === collection.get("R") && collection.get("U") === collection.get("D")
};