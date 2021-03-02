// You are given an array items, where each items[i] = [typei, colori, namei] describes the type, color, and name of the ith item. You are also given a rule represented by two strings, ruleKey and ruleValue.
// The ith item is said to match the rule if one of the following is true:
//     ruleKey == "type" and ruleValue == typei.
//     ruleKey == "color" and ruleValue == colori.
//     ruleKey == "name" and ruleValue == namei.
// Return the number of items that match the given rule.

class Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        items.filter({ $0[RuleKey(rawValue: ruleKey)!.index] == ruleValue }).count
    }
    
    enum RuleKey: String {
        case type
        case color
        case name
        
        var index: Int {
            switch self {
                case .type: return 0
                case .color: return 1
                case .name: return 2
            }
        }
    }
}