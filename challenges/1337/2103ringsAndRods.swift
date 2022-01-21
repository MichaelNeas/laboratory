// There are n rings and each ring is either red, green, or blue. The rings are distributed across ten rods labeled from 0 to 9.

// You are given a string rings of length 2n that describes the n rings that are placed onto the rods. Every two characters in rings forms a color-position pair that is used to describe each ring where:

// The first character of the ith pair denotes the ith ring's color ('R', 'G', 'B').
// The second character of the ith pair denotes the rod that the ith ring is placed on ('0' to '9').
// For example, "R3G2B1" describes n == 3 rings: a red ring placed onto the rod labeled 3, a green ring placed onto the rod labeled 2, and a blue ring placed onto the rod labeled 1.

// Return the number of rods that have all three colors of rings on them.

class Solution {
    func countPoints(_ rings: String) -> Int {
        let ringArr = Array(rings)
        var ringCounts = [Int: Ring]()
        for offset in stride(from: 0, to: ringArr.count, by: 2) {
            let index = ringArr[offset + 1].wholeNumberValue ?? 0
            
            if var ring = ringCounts[index] {
                ring.setColor(value: ringArr[offset])
                ringCounts[index] = ring
            } else {
                ringCounts[index] = Ring(red: ringArr[offset] == "R",
                                        blue: ringArr[offset] == "B",
                                        green: ringArr[offset] == "G")
            }
            
        }
        return ringCounts.values.reduce(0, { $0 + $1.isComplete })
    }
}

struct Ring {
    var red = false
    var blue = false
    var green = false
    
    var isComplete: Int {
        (red && blue && green) ? 1 : 0
    }
    
    mutating func setColor(value: Character) {
        switch value {
            case "R":
                red = true
            case "B":
                blue = true
            default:
                green = true
        }
    }
}