/**
 *  You're now a baseball game point recorder.

    Given a list of strings, each string can be one of the 4 following types:

    Integer (one round's score): Directly represents the number of points you get in this round.
    "+" (one round's score): Represents that the points you get in this round are the sum of the last two valid round's points.
    "D" (one round's score): Represents that the points you get in this round are the doubled data of the last valid round's points.
    "C" (an operation, which isn't a round's score): Represents the last valid round's points you get were invalid and should be removed.

    Each round's operation is permanent and could have an impact on the round before and the round after.

    You need to return the sum of the points you could get in all the rounds. 
 * @param {string[]} ops
 * @return {number}
 */
var calPoints = function(ops) {
    let lastValid = []
    return ops.reduce((prev, curr) => {
        switch (curr) {
            case "D":
                prev += lastValid[lastValid.length-1]*2
                lastValid.push(lastValid[lastValid.length-1]*2)
                break
            case "C":
                prev -= lastValid.pop()
                break
            case "+":
                prev += lastValid[lastValid.length-1] + lastValid[lastValid.length-2]
                lastValid.push(lastValid[lastValid.length-1] + lastValid[lastValid.length-2])
                break
            default:
                prev += parseInt(curr)
                lastValid.push(parseInt(curr))
                break
        }
        return prev
    }, 0)
};