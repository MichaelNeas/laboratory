/// Given a string S, return the "reversed" string where all characters that are not a letter stay in the same place, and all letters reverse their positions.

class Solution {
    func reverseOnlyLettersRegex(_ S: String) -> String {
        var keepers: [(Int, Character)] = []
        var s = ""
        for char in S.enumerated(){
            if String(char.element).matches("[A-Za-z]") {
                s = String(char.element) + s
            } else {
                keepers.append(char)
            }
        }
        var stringArray = Array(s)
        for kept in keepers {
            stringArray.insert(kept.1, at: kept.0)
        }
        return String(stringArray)
    }

    func reverseOnlyLettersCharSets(_ S: String) -> String {
        var a = Array(S.unicodeScalars)
        
        var i = 0
        var j = a.count - 1
        
        while i < j {
            while !CharacterSet.letters.contains(a[i]) && i < j { i += 1 }
            while !CharacterSet.letters.contains(a[j]) && i < j { j -= 1 }
            
            let t = a[i]
            a[i] = a[j]
            a[j] = t
            i += 1
            j -= 1 
        }
        
        var ret = ""
        a.forEach({ ret += String(Character(UnicodeScalar($0))) })
        return ret
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}