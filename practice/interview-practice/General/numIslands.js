// Given a 2D array of 1s and 0s, count the number of "islands of 1s" (e.g. groups of connecting 1s, A group of connected 1s forms an island, 1 or more 1's)

let data = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]

let numIslands = grid => {
    let count = 0
    let h = grid.length
    let w = h && grid[0].length
    for(let i = 0; i < h; i ++){
        for(let j = 0; j < w; j ++){
            if(grid[i][j] === '0') continue
            count ++
            dfs(i, j)
        }
    }

    return count
    
    let dfs = (n, m) => {
        if(n < 0 || m < 0 || n >= h || m >= w) return
        if(grid[n][m] === '1'){
            grid[n][m] = '0'
            dfs(n + 1, m)
            dfs(n - 1, m)
            dfs(n, m + 1)
            dfs(n, m - 1)
        }
    }
};

console.log(`Given:${data}`)
console.log(numIslands(grid))