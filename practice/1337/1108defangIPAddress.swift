/// Given a valid (IPv4) IP address, return a defanged version of that IP address.
/// A defanged IP address replaces every period "." with "[.]".

class Solution {
    func defangIPaddr(_ address: String) -> String {
        let regex = try! NSRegularExpression(pattern: "\\.", options: NSRegularExpression.Options.caseInsensitive)
        return regex.stringByReplacingMatches(in: address, options: [], range: NSMakeRange(0, address.count), withTemplate: "[.]")
    }

    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}