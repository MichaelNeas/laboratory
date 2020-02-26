/// Write a program to count the number of days between two dates.
/// The two dates are given as strings, their format is YYYY-MM-DD as shown in the examples.
class Solution {
    func daysBetweenDates(_ date1: String, _ date2: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date1 = dateFormatter.date(from: date1),
        let date2 = dateFormatter.date(from: date2) else { return 0 }
        return abs(Calendar.current.dateComponents([.day], from: date1, to: date2).day!)
    }
}