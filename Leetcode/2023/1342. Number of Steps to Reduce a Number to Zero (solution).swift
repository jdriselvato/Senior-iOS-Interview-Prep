// # 1342. Number of Steps to Reduce a Number to Zero

// Given an integer num, return the number of steps to reduce it to zero.

// In one step, if the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.

// Example 1:

// Input: num = 14
// Output: 6
// Explanation: 
// Step 1) 14 is even; divide by 2 and obtain 7. 
// Step 2) 7 is odd; subtract 1 and obtain 6.
// Step 3) 6 is even; divide by 2 and obtain 3. 
// Step 4) 3 is odd; subtract 1 and obtain 2. 
// Step 5) 2 is even; divide by 2 and obtain 1. 
// Step 6) 1 is odd; subtract 1 and obtain 0.

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var current: Int = num
        var steps: Int = 0
        while current != 0 {
            if current % 2 == 0 {
                current = current / 2
            } else if current % 2 != 0 {
                current = current - 1
            }
            steps = steps + 1
        }
        return steps
    }
}

// alternative

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var current: Int = num
        var steps: Int = 0

        while current != 0 {
            let isEven = current % 2 == 0
            current = isEven ? current / 2 : current - 1
            steps = steps + 1
        }
        return steps
    }
}

// Time complexity: O(n)
// Space: O(1)
