//given a grid with colors return the max number of connected colors, no diagonals

let node = (x,y) => {
    let val = ""
    let findNeighbors = () => [node(x+1, y),node(x-1, y),node(x, y+1),node(x, y-1)]
    return { x: x, y: y , val: val, findNeighbors: findNeighbors }
}

let checkValidity = (arrOfNodes, grid, desiredVal) => {
    return arrOfNodes
        .reduce((prev, curr) => {
        if (curr.x >= 0 && curr.x < grid.length && curr.y >= 0 && curr.y < grid[0].length)
            prev.push(curr)
        return prev
    }, [])
        .map(node => {
            node.val = grid[node.x][node.y]
            return node
        })
        .filter(node => desiredVal === node.val)
}

let dfs = (grid, x, y, goal) => {
    let validGroup = [node(x,y,goal)];
    let neighbors = [node(x,y,goal)];
    while(neighbors.length > 0){
        let activeCheck = neighbors.shift()
        let solidNeighbors = checkValidity(activeCheck.findNeighbors(), grid, goal).filter(val => {
            for(let i=0;i<validGroup.length;i++){
                if(validGroup[i].x === val.x && validGroup[i].y === val.y){
                    return false
                }
            }
            return true
        })
        neighbors = [...neighbors, ...solidNeighbors];
        validGroup = [...validGroup, ...solidNeighbors];
    }
    return validGroup
}


let grid = [["B", "B", "W", "R"],
            ["B", "B", "W", "R"],
            ["B", "B", "W", "R"],
            ["B", "W", "W", "R"],
            ["B", "W", "R", "W"],
            ["R", "W", "W", "W"],
            ["B", "B", "W", "R"],
            ["B", "B", "W", "R"],
            ["B", "B", "W", "R"],
            ["B", "B", "W", "W"],
            ["B", "W", "R", "W"],
            ["R", "W", "W", "W"]];

let cacheFound = []
let allConnections = []

for(let i=0; i<grid.length; i++){
    for(let j=0; j<grid[0].length; j++){
        
        // optimization to store found nodes
        let found = false
        for(let k = 0; k<cacheFound.length; k++){
            if(cacheFound[k].x === i && cacheFound[k].y === j){
                found = true
                break
            } 
        }
        if (!found ){
            let resultingConnection = dfs(grid, i, j, grid[i][j])
            console.log(`Valid group for ${i}, ${j} : ${grid[i][j]}`)
            allConnections = allConnections.concat([resultingConnection])
            cacheFound = [...cacheFound, ...resultingConnection.filter(val => {
                for(let i=0;i<cacheFound.length;i++){
                    if(cacheFound[i].x === val.x && cacheFound[i].y === val.y){
                        return false
                    }
                }
                return true
            })]
        }
    }
}

let winner = [];
for(let i=0; i<allConnections.length; i++){
    if(allConnections[i].length > winner.length){
        winner = allConnections[i]
    }
}

console.log("And the longest connection goes to")
console.log(winner)