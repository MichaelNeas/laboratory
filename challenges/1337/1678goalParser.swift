// You own a Goal Parser that can interpret a string command. The command consists of an alphabet of "G", "()" and/or "(al)" in some order. The Goal Parser will interpret "G" as the string "G", "()" as the string "o", and "(al)" as the string "al". The interpreted strings are then concatenated in the original order.
// Given the string command, return the Goal Parser's interpretation of command.
class Solution {
    func interpret(_ command: String) -> String {
        var final = ""
        var prev: Character = "A"
        for letter in command {
            if letter == "G" {
                final.append(letter)
            } else if letter == ")" {
                final.append(prev == "(" ? "o" : "al")
            } 
            prev = letter
        }
        return final
    }
}