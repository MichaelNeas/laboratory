/// There are N rooms and you start in room 0.  Each room has a distinct number in 0, 1, 2, ..., N-1, 
/// and each room may have some keys to access the next room. 
/// each room i has a list of keys rooms[i], and each key rooms[i][j] is an integer in [0, 1, ..., N-1] 
/// where N = rooms.length.  A key rooms[i][j] = v opens the room with number v.
/// Initially, all the rooms start locked (except for room 0). 
/// You can walk back and forth between rooms freely.
/// Return true if and only if you can enter every room.

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visitedRooms: Set<Int> = Set()
        if rooms[0].count == 0 {
            return rooms.count == 1 ? true : false
        }
        var roomsLeft = [0]
        while roomsLeft.count > 0 {
            visitedRooms.insert(roomsLeft[0])
            for key in rooms[roomsLeft[0]] {
                if !visitedRooms.contains(key) {
                    roomsLeft.append(key)
                }
            }
            roomsLeft.removeFirst()
        }
        
        visitedRooms.remove(0)
        return visitedRooms.count == rooms.count - 1
    }
}