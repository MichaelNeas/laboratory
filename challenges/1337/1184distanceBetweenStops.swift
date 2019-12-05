///    A bus has n stops numbered from 0 to n - 1 that form a circle. We know the distance between all pairs of 
///    neighboring stops where distance[i] is the distance between the stops number i and (i + 1) % n.
///    The bus goes along both directions i.e. clockwise and counterclockwise.
///    Return the shortest distance between the given start and destination stops.

class Solution {
    func distanceBetweenBusStops(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
        var a = min(start, destination)
		var b = max(start, destination)
		return min(distance[a..<b].reduce(0, +), distance.reduce(0, +) - distance[a..<b].reduce(0, +))
    }
}