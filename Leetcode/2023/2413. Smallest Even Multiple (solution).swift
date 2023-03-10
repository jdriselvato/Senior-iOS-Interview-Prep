
// # 2413. Smallest Even Multiple

// https://leetcode.com/problems/smallest-even-multiple/description/

// Given a positive integer n, return the smallest positive integer that is a multiple of both 2 and n.
 

// Example 1:

// Input: n = 5
// Output: 10
// Explanation: The smallest multiple of both 5 and 2 is 10.
// Example 2:

// Input: n = 6
// Output: 6
// Explanation: The smallest multiple of both 6 and 2 is 6. Note that a number is a multiple of itself.


// My original solution: O(n)

class Solution {
    func smallestEvenMultiple(_ n: Int) -> Int {
        for i in 1...(n*2) {
            if i % n == 0 && i % 2 == 0 {
                return i
            }
        }
        return 0
    }
}


// O(1) solution:


class Solution {
    func smallestEvenMultiple(_ n: Int) -> Int {
        return n % 2 == 0 ? n : n * 2
    }
}

let s = Solution().smallestEvenMultiple(5)
print(s)
