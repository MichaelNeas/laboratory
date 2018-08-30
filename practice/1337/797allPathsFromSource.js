// Given a directed, acyclic graph of N nodes.  Find all possible paths from node 0 to node N-1, and return them in any order.
// The graph is given as follows:  the nodes are 0, 1, ..., graph.length - 1.  graph[i] is a list of all nodes j for which the edge (i, j) exists.
let dfs = (i, graph, sol, ans) => {
    sol.push(i)
    
    if(i === graph.length-1){
        ans.push(sol)
        return ans
    }
    
    graph[i].forEach(index => {
        dfs(index, graph, [...sol], ans)
    })
    return ans
}

/**
 * @param {number[][]} graph
 * @return {number[][]}
 */
var allPathsSourceTarget = function(graph) {
    return dfs(0, graph, [], [])
}

// A different DFS

var allPathsSourceTarget = module.exports = function(graph) {
    var res = [];
    var path = [];  
					
    path.push(0);
   
    dfsSearch(0); 
    
    function dfsSearch(node) {
         
        if (node == graph.length - 1) {           
            res.push(path.slice(0));           
        } else
            for (nextNode of graph[node]) {
                path.push(nextNode);
                dfsSearch(nextNode);
                path.pop();
            }
    }
    return res;
};