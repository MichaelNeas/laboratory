/**
 * Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 * @param {character[][]} grid
 * @return {number}
 */
var numIslands = function(grid) {
    let count = 0
    for(let i=0;i<grid.length; i++){
        for(let j=0;j<grid[0].length; j++){
            if(grid[i][j] === '1') {
                bfs(i, j, grid) ? count++ : grid[i][j] = '-1'
            }
        }
    }
    console.log(grid)
    return count
};

let bfs = (x, y, grid) => {
    let queue = [{x:x,y:y}]
    while(queue.length>0){
        let curr = queue.shift()
        let neighborhood = getNeighbors(curr.x, curr.y, grid)
        queue.push(...neighborhood)
    }
    return 1
}

let getNeighbors = (i, j, grid) => {
    let retArray = []
    if(grid[i][j+1] && grid[i][j+1] === '1') {
        grid[i][j+1] = -1
        retArray.push({x:i,y:j+1})
    }
    if(grid[i+1] && grid[i+1][j] === '1') {
        grid[i+1][j] = -1
        retArray.push({x:i+1,y:j})
    }
    if(grid[i][j-1] && grid[i][j-1] === '1') {
        grid[i][j-1] = -1
        retArray.push({x:i,y:j-1})
    }
    if(grid[i-1] && grid[i-1][j] === '1') {
        grid[i-1][j] = -1
        retArray.push({x:i-1,y:j})
    }
    return retArray
}



// DFS
var numIslands = function(grid) {
    let count = 0;
    let h = grid.length;
    let w = h && grid[0].length;
    for(let i = 0; i < h; i ++){
        for(let j = 0; j < w; j ++){
            if(grid[i][j] === '0') continue;
            count ++;
            dfs(i, j);
        }
    }
    
    return count;
    
    function dfs(n, m){
        if(n < 0 || m < 0 || n >= h || m >= w) return;
        if(grid[n][m] === '1'){
            grid[n][m] = '0';
            dfs(n + 1, m);
            dfs(n - 1, m);
            dfs(n, m + 1);
            dfs(n, m - 1);
        }
    }
};