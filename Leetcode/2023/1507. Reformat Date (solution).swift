// 1507. Reformat Date

// Input: date = "20th Oct 2052"
// Output: "2052-10-20"

class Solution {
    let months: [String: Int] = [
        "Jan":1, 
        "Feb":2, 
        "Mar":3, 
        "Apr":4, 
        "May":5, 
        "Jun":6, 
        "Jul":7, 
        "Aug":8, 
        "Sep":9, 
        "Oct":10, 
        "Nov":11, 
        "Dec":12
    ]
    
    func reformatDate(_ date: String) -> String {
        let dateArray = date.split(separator: " ")
        
        let year = String(dateArray[2])
        let month = months[String(dateArray[1]), default: 0]
        let monthFormatted = month > 9 ? "\(month)" : "0\(month)"
        let day = getDay(day: String(dateArray[0]))
        let dayFormatted = day > 9 ? "\(day)" : "0\(day)"
        
        return "\(year)-\(monthFormatted)-\(dayFormatted)" // YYYY-MM-DD
    }
    
    private func getDay(day: String) -> Int {
        var day = day
        day = String(day.dropLast())
        day = String(day.dropLast())
        print(day)
        return Int(day) ?? 0
    }
}

let s = Solution().reformatDate("6th Jun 1933")
print(s == "1933-06-06", s)


/// Improvements:

// the leading zero caught me off guard at the end of completing this. Next time I would make the month dictionary a string ["jan"] = "01"
// For day instead of returning a returning as an Int, returning as a string checking the character count and appending 0 if needed.
