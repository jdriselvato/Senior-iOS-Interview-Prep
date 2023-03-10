// # 2574. Left and Right Sum Differences

// https://leetcode.com/problems/left-and-right-sum-differences/description/

// Given a 0-indexed integer array nums, find a 0-indexed integer array answer where:

// answer.length == nums.length.
// answer[i] = |leftSum[i] - rightSum[i]|.
// Where:

// leftSum[i] is the sum of elements to the left of the index i in the array nums. If there is no such element, leftSum[i] = 0.
// rightSum[i] is the sum of elements to the right of the index i in the array nums. If there is no such element, rightSum[i] = 0.
// Return the array answer.

// Example 1:

// Input: nums = [10,4,8,3]
// Output: [15,1,11,22]
// Explanation: The array leftSum is [0,10,14,22] and the array rightSum is [15,11,3,0].
// The array answer is [|0 - 15|,|10 - 11|,|14 - 3|,|22 - 0|] = [15,1,11,22].


// Example 2:

// Input: nums = [1]
// Output: [0]
// Explanation: The array leftSum is [0] and the array rightSum is [0].
// The array answer is [|0 - 0|] = [0].

class Solution {
    func leftRigthDifference(_ nums: [Int]) -> [Int] {
        var leftSum: [Int] = []
        var rightSum: [Int] = []
        
        for i in 0...(nums.count - 1) {
            if i == 0 {
                leftSum.append(0)
            } else {
                leftSum.append(leftSum[i-1]+nums[i-1])
            }
            
            let rightPointer = nums.count - 1
            if (rightPointer - i) == rightPointer {
                rightSum.append(0)
            } else {
                let j = rightPointer - (i-1)
                let rightAddition = rightSum[rightSum.count - i] + nums[j] // mess up at getting the correct index of rightSum here
                rightSum.insert(rightAddition, at: 0)
            }
        }
        
        var result: [Int] = []
        for i in 0...(leftSum.count - 1) {
            let a = abs(leftSum[i] - rightSum[i])
            result.append(a)
        }
        return result
    }
}

let s = Solution().leftRigthDifference([1])
print("solution:", s)

/// Can we do this with recursion?

class Solution {
	var nums: [Int] = [] // to not pass in the recursion stack every time

    func leftRigthDifference(_ nums: [Int]) -> [Int] {
    	nums = nums

        var leftSum: [Int] = []
        leftDiff(leftSum, start: 0)
        print("left:", leftSum)

        var rightSum: [Int] = []
        rightDiff(rightSum, start: nums.count-1)

        var solution: [Int] = []

        return solution
    }

    func leftDiff(_ sum: inout [Int], start: Int) {
    	guard start < nums.count else { return }

    	if start == 0 {
    		sum.append(0)
    	} else {
    		let calc = sum[i-1] + nums[start]
    		sum.append(calc)
    	}

    	leftDiff(leftSum, start: start)
    }

    func rightDiff(_ sum: inout [Int], start: Int) {

    }
}