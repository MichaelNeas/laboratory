/// Given a string S of lowercase letters, a duplicate removal consists of choosing two adjacent and equal letters, and removing them.
/// We repeatedly make duplicate removals on S until we no longer can.
/// Return the final string after all such duplicate removals have been made.  It is guaranteed the answer is unique.

class Solution {
    func removeDuplicates(_ S: String) -> String {
        var strCopy = Array(S)
        var counter = 0
        while counter < strCopy.count - 1 {
            if strCopy[counter] == strCopy[counter + 1]{
                strCopy.remove(at: counter)
                strCopy.remove(at: counter)
                //strCopy.removeSubrange(strCopy.index(strCopy.startIndex, offsetBy: counter)..<strCopy.index(strCopy.startIndex, offsetBy: counter+2))
                if counter > 0 {
                    counter -= 1
                }
            } else {
                counter += 1    
            }   
        }
        
        return strCopy.map(String.init).joined(separator: "")
    }
}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
