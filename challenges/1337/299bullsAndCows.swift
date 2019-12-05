/// You are playing the following Bulls and Cows game with your friend: You write down a number and ask your friend to guess what the number is. 
/// Each time your friend makes a guess, you provide a hint that indicates how many digits in said guess match your secret number exactly in both 
/// digit and position (called "bulls") and how many digits match the secret number but locate in the wrong position (called "cows"). 
/// Your friend will use successive guesses and hints to eventually derive the secret number.
/// Write a function to return a hint according to the secret number and friend's guess, use A to indicate the bulls and B to indicate the cows. 
/// Please note that both secret number and friend's guess may contain duplicate digits.

class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        let sec = secret.compactMap{ $0.wholeNumberValue }
        let gue = guess.compactMap{ $0.wholeNumberValue }
        var secDict = [String: Int]()
        var gueDict = [String: Int]()
        
        var A = 0 // bull
        var B = 0 // cow
        
        for i in 0..<gue.count {
            if gue[i] == sec[i] {
                A += 1
                continue
            }
            
            // check the secretDictionary for the guess
            if secDict[gue[i]] != nil && secDict[gue[i]]! > 0 {
                secDict[gue[i]]! -= 1
                B += 1
            } else {
                if gueDict[gue[i]] != nil {
                    gueDict[gue[i]]! += 1
                } else {
                    gueDict[gue[i]] = 1
                }
            }
            
            
            // check the guessDictionary for the secret
            if gueDict[sec[i]] != nil && gueDict[sec[i]]! > 0 {
                gueDict[sec[i]]! -= 1
                B += 1
            } else {
                if secDict[sec[i]] != nil {
                    secDict[sec[i]]! += 1
                } else {
                    secDict[sec[i]] = 1
                }
            }
        }
        
        return "\(A)A\(B)B"
    }
}