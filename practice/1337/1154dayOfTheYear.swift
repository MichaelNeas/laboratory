// Given a string date representing a Gregorian calendar date formatted as YYYY-MM-DD, return the day number of the year.
class Solution {
    func dayOfYear(_ date: String) -> Int {
        let firstOfYear = "\(date.components(separatedBy: "-")[0])-01-01"
        let calendar = Calendar.current
        let finalDate = calendar.startOfDay(for: Date(date))
        let firstOfTheYear = calendar.startOfDay(for: Date(firstOfYear))
        return calendar.dateComponents([.day], from: firstOfTheYear, to: finalDate).day! + 1
    }
}

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}
