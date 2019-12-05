/**
 * Validate sudoku
 * Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
 * Each row must contain the digits 1-9 without repetition.
 * Each column must contain the digits 1-9 without repetition.
 * Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 * @param {character[][]} board
 * @return {boolean}
 */
var isValidSudoku = function(board) {
    let checkSubBox = (x,y) => {
        let map = {}
        for(let i=x-1;i<=x+1;i++){
            for(let j=y-1;j<=y+1;j++){
                if(board[i][j] !== '.'){
                    if(map[board[i][j]] === 1){
                        return false
                    }
                    map[board[i][j]] = 1 
                }
            }
        }
        return true
    }
    
    let checkRow = r => {
        let map = {}
        for(let i=0; i<board[0].length; i++){
            if(board[r][i] !== '.'){
                if(map[board[r][i]] === 1)
                    return false
                map[board[r][i]] = 1 
            }
            if((r===1 || r===4 || r===7) && (i===1 || i===4 || i===7))
               if(!checkSubBox(r,i)) return false
        }
        return true
    }
    
    let checkColumn = c => {
        let map = {}
        for(let i=0; i<board.length; i++){
            if(board[i][c] !== '.'){
                if(map[board[i][c]] === 1)
                    return false
                map[board[i][c]] = 1 
            }
        }
        return true
    }
    
    for(let i=0; i<board.length; i++){
        if(!checkRow(i) || !checkColumn(i)){
            return false
        }
    }
    
    return true
};



/**
 * Number 1 js solu
 * @param {character[][]} board
 * @return {boolean}
 */
var isValidSudoku = function(board) {    
    const boxes = [{}, {}, {}, {}, {}, {}, {}, {}, {}];
    const cols = [{}, {}, {}, {}, {}, {}, {}, {}, {}]; 
    const rows = [{}, {}, {}, {}, {}, {}, {}, {}, {}];   
    
    for (let i = 0; i < 9; i++) {              
        for (let j = 0; j < 9; j++) {            
            const digit = board[i][j];
            
            if (digit !== '.') {
                const k = Math.floor(j / 3) + (Math.floor(i / 3) * 3);

                if (boxes[k][digit] || cols[j][digit] || rows[i][digit]) {
                    return false;
                }

                boxes[k][digit] = cols[j][digit] = rows[i][digit] = true;       
            }
        }
    }
    
    return true;
};