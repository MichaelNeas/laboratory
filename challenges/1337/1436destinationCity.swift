// You are given the array paths, where paths[i] = [cityAi, cityBi] 
// means there exists a direct path going from cityAi to cityBi. 
// Return the destination city, that is, the city without any path outgoing to another city.
// It is guaranteed that the graph of paths forms a line without any loop, therefore, there will be exactly one destination city.

class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var destinations = Set<String>()
        var outgoing = Set<String>()
        for path in paths {
            outgoing.insert(path[0])
            destinations.insert(path[1])
        }
        return destinations.subtracting(outgoing).first!
    }
}