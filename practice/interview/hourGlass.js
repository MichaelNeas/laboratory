function main() {
    var arr = [];
    for(arr_i = 0; arr_i < 6; arr_i++){
       arr[arr_i] = readLine().split(' ');
       arr[arr_i] = arr[arr_i].map(Number);
    }
    let sum = [];
    let i,j;
    for(i = 0; i < 4; i++){
        for(j = 0; j < 4; j++ ){
            sum.push(arr[i][j] + arr[i][j+1] + arr[i][j+2]
                    + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1]
                    + arr[i+2][j+2]);
        }
    }
    sum.sort(function(a, b){return b-a});
    console.log(sum[0]);
}