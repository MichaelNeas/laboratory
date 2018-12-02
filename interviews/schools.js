let school = [
    ["shelby smith", "jack granger", "jill pertuli", "dillon swartz", "alex bezzo", "sean mcgrey"],
    ["janet smith", "jack granger", "jill pertuli", "craig brearley", "alex bezzo", "craig near"],
    ["bob smith", "paul lubey", "andrew farley", "dillon swartz", "sean bezzo", "janet smith"],
    ["sean bezzo", "ben little", "jill pertuli", "shelby smith", "alex bezzo", "sean mcgrey"],
    ["bob smith", "jack granger", "craig near", "paul lubey", "andrew farley", "shelby smith"],
    ["bob smith", "sean bezzo", "paul lubey", "ben little", "janet smith", "andrew farley"],
]

let studentClassCount = school.reduce((prev, curr) => {
    curr.forEach(val => prev[val] = prev[val] ? prev[val] + 1 : 1)
    return prev
} , {})

console.log(studentClassCount)
console.log("-----------------------------------------")

let uniqueStudentsOrdered = school => {
    let unique = new Set();
    for(let i = 0; i<school.length; i++){
        school[i].forEach(student => unique.add(student))
    }
    return [...unique]
        .map(student => student.split(" "))
        .sort((a,b) => a[0].localeCompare(b[0]))
        .sort((a,b) => a[1].localeCompare(b[1]))
        .map(student => `${student[1]}, ${student[0]}`)
}

console.log(uniqueStudentsOrdered(school))