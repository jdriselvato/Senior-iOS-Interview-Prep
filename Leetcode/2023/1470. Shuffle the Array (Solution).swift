// # 1470. Shuffle the Array

// https://leetcode.com/problems/shuffle-the-array/

// Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

// Return the array in the form [x1,y1,x2,y2,...,xn,yn].

// Example 1:

// Input: nums = [2,5,1,3,4,7], n = 3
// Output: [2,3,5,4,1,7] 
// Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var nums = nums
        shuffler(&nums, x: 0, y: n, xMax: n-1, yMax: nums.count - 1)
        return nums
    }
    
    func shuffler(_ nums: inout [Int], x: Int, y: Int, xMax: Int, yMax: Int) {
        if x > xMax && y > yMax { return }
        let removed = nums.remove(at: y)
        nums.insert(removed, at: x+1)
        shuffler(&nums, x: x + 2, y: y + 1, xMax: xMax, yMax: yMax)
    }
}

// decided to practice this as a form of recursion. Not a very common swift way to do it. 
// I'm happy it worked first try