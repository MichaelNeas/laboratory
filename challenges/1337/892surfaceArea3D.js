let checkNeighbors = (x,y,grid) => {
    let count = 0
    let baseVal = grid[x][y]
    if(x-1 >= 0 && grid[x-1][y] !== undefined) count += (baseVal - grid[x-1][y]) > 0 ? (baseVal - grid[x-1][y]) : 0
    else count += baseVal
    if(y-1 >= 0 && grid[x][y-1] !== undefined)count += (baseVal - grid[x][y-1]) > 0 ? (baseVal - grid[x][y-1]) : 0
    else count += baseVal 
    if(x+1 < grid[0].length && grid[x+1][y] !== undefined)count += (baseVal - grid[x+1][y]) > 0 ? (baseVal - grid[x+1][y]) : 0
    else count += baseVal
    if(y+1 < grid.length && grid[x][y+1] !== undefined)count += (baseVal - grid[x][y+1]) > 0 ? (baseVal - grid[x][y+1]) : 0
    else count += baseVal
    return count
}

/**
 * @param {number[][]} grid
 * @return {number}
 */
var surfaceArea = function(grid) {
    let count = 0
    for(let i=0;i<grid.length; i++){
        for(let j=0;j<grid[0].length; j++){
            if(grid[i][j]!==0) count += 2 // for top and under of cube
            count += checkNeighbors(i,j,grid)
            // for the corner walls
            // if(i===0 && j===0) count += (grid[i][j] * 2)
            // if(i===0 && j===grid[0].length -1) count += (grid[i][j] * 2)
            // if(i===grid.length-1 && j===0) count += (grid[i][j] * 2)
            // if(i===grid.length-1 && j===grid[0].length-1) count += (grid[i][j] * 2)
        }
    }
    
    return count
};