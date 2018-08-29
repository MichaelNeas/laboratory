/**
 * @param {number[][]} grid
 * @return {number}
 */
var maxIncreaseKeepingSkyline = function(grid) {
    let sum = 0;
    for(let i=0;i<grid.length;i++){
        for(let j=0;j<grid[0].length;j++){
            let max = -1;
            for(let k=0; k<grid.length;k++){
                if (max<grid[k][j]){
                    max = grid[k][j]
                }
            }
            sum += (Math.min(Math.max(...grid[i]), max) - grid[i][j])
            //grid[i][j] = Math.min(Math.max(...grid[i]), Math.max(grid[0][j], grid[1][j], grid[2][j], grid[3][j]))
        }
    }
    return sum
};

/* Java sol n^2
    public int maxIncreaseKeepingSkyline(int[][] grid) {
        int n = grid.length;
        int[] col = new int[n], row = new int[n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                row[i] = Math.max(row[i], grid[i][j]);
                col[j] = Math.max(col[j], grid[i][j]);
            }
        }
        int res = 0;
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                res += Math.min(row[i], col[j]) - grid[i][j];
        return res;
    }
    */