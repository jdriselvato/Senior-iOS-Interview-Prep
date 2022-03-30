/// Problem 977

/*
977. Squares of a Sorted Array

Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

Example 1:

Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].

Example 2:

Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]
 

Constraints:

1 <= nums.length <= 104
-104 <= nums[i] <= 104
nums is sorted in non-decreasing order.

*/

import Foundation

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        
        var temp: [Int] = []
        
        var i = 0
        var j = nums.count-1
        
        while i <= j {
            let iNum = squared(nums[i])
            let jNum = squared(nums[j])
            print("i:", iNum, "j", jNum)
            if iNum > jNum {
                temp.insert(iNum, at:0)
                i += 1
                print("\(iNum) is larger")
            } else {
                temp.insert(jNum, at:0)
                j -= 1
                print("\(jNum) is larger")
            }
                        
        }
        
        return temp
    }
    
    func squared(_ num: Int) -> Int {
        if num == 0 { return 0 }
        return Int(pow(Double(num), Double(2)))        
    }
}

let squares = Solution().sortedSquares([-4,-1,0,3,10])

print("Sorted & Squared:", squares)


/// Turns out x*x = x^2 lol