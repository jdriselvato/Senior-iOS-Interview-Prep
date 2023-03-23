// 278. First Bad Version
// https://leetcode.com/problems/first-bad-version/description/?envType=study-plan&id=algorithm-i


/**
 * The knows API is defined in the parent class VersionControl.
 *     [1,2,3,4,|5|,6,7,8,9,10]
 */

class Solution {
    let bad = 9003
    func isBadVersion(_ version: Int) -> Bool {
        return version >= bad
    }
    
    func firstBadVersion(_ n: Int) -> Int {
        var min = 1
        var max = n
        
        var firstBad = n
        
        while min <= max {
            let guess = Int((min + max)/2)
            print(min, guess, max)
            if isBadVersion(guess) == true { // >=
                firstBad = firstBad < guess ? firstBad : guess
                max = guess - 1
            }
            
            if isBadVersion(guess) == false { // <
                min = guess + 1
            }
        }
        
        return firstBad
    }
}

let s = Solution().firstBadVersion(1009099)
print(s)
