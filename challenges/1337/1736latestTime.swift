// You are given a string time in the form of hh:mm, where some of the digits in the string are hidden (represented by ?).
// The valid times are those inclusively between 00:00 and 23:59.
// Return the latest valid time you can get from time by replacing the hidden digits.

class Solution {
    func maximumTime(_ time: String) -> String {
        let times: [String] = Array(time).map{ String($0) }
        var largest = ""
        if times[0] == "?" {
            if let mins = Int(times[1]), mins > 3 {
                largest.append("1")
            } else {
                largest.append("2")
            }
        } else {
            largest.append(times[0])
        }
        
        if times[1] == "?" {
            if let hour = Int(times[0]) {
                if hour == 2 {
                    largest.append("3")
                } else {
                    largest.append("9")  
                }
                
            } else {
                largest.append("3")
            }
        } else {
            largest.append(times[1])
        }
        
        largest.append(":")
        
        if times[3] == "?" {
            largest.append("5")
        } else {
            largest.append(times[3])
        }
        
        if times[4] == "?" {
            largest.append("9")
        } else {
            largest.append(times[4])
        }
        
        
        return largest
    }
}