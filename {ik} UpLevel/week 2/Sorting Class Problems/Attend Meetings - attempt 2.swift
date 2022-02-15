
/* Given a list of meeting intervals where each interval consists of a start and an end time,
 * check if a person can attend all the given meetings such that only one meeting can be attended at a time. 
 * return 0 for false return 1 for true
 *
 * [[1, 5], [5, 8], [10, 15]] 
 *
 */

class Solution {
    func can_attend_all_meetings(intervals: [[Int]]) -> Int {
        
        let temp = intervals.sorted(by: { $0[0] < $1[0] }).flatMap({ $0 })
        print(temp)
        for i in (0 ... temp.count - 1).reversed() {
            let start = i - 1
            let end = i
            let pStart = i - 3
            let pEnd = i - 2

            if start > 0 && pEnd > 0 {
                print(temp[start], "vs", temp[pEnd])
            }

            if start > 0 && pEnd > 0 // check to ensure these index exist
                && temp[start] < temp[pEnd] {
                    return 0
                }
        }

        return 1
    }
}

let intervals = [ [4, 7], [1, 5] ] 

let result = Solution().can_attend_all_meetings(intervals: intervals)

print(result)
