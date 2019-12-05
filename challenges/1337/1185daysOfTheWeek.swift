/// Given a date, return the corresponding day of the week for that date.
/// The input is given as three integers representing the day, month and year respectively.

class Solution {
    func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: "\(year)-\(month)-\(day)")
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: date!)
        
        return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][weekDay - 1]
    }
}