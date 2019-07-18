/// Given a valid (IPv4) IP address, return a defanged version of that IP address.
/// A defanged IP address replaces every period "." with "[.]".

class Solution {
    // slowest
    func defangIPaddr(_ address: String) -> String {
        let regex = try! NSRegularExpression(pattern: "\\.")
        return regex.stringByReplacingMatches(in: address, options: [], range: NSMakeRange(0, address.count), withTemplate: "[.]")
    }

    // middle
    func defangIPaddr(_ address: String) -> String {
        return address.reduce(String() , { $0 + ($1 == "." ? "[.]" : String($1)) })
    }

    // fastest
    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}