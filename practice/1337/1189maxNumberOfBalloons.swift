/// Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.
/// You can use each character in text at most once. Return the maximum number of instances that can be formed.
class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var textCountMap: [Character: Int] = ["b":0, 
                            "l":0,
                            "a":0,
                            "o":0,
                            "n":0]
        for char in text {
            switch char {
                case "b",
                    "l",
                    "a",
                    "o",
                    "n":
                    textCountMap[char, default: 0] += 1
                default:
                    continue
            }
        }
        
        if textCountMap["o"]! % 2 == 1 { 
            textCountMap["o"] = textCountMap["o"]! - 1 
        }
        
        if textCountMap["l"]! % 2 == 1 { 
            textCountMap["l"] = textCountMap["l"]! - 1 
        }
        
        return min(textCountMap["b"]!, textCountMap["n"]!, textCountMap["a"]!, textCountMap["o"]!/2, textCountMap["l"]!/2)
    }
}