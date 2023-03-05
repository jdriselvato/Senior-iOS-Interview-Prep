// # 724. Find Pivot Index

// Given an array of integers nums, calculate the pivot index of this array.

// The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.

// If the index is on the left edge of the array, then the left sum is 0 because there are no elements to the left. This also applies to the right edge of the array.

// Return the leftmost pivot index. If no such index exists, return -1.

// Example 1:

// Input: nums = [1,7,3,6,5,6]
// Output: 3
// Explanation:
// The pivot index is 3.
// Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
// Right sum = nums[4] + nums[5] = 5 + 6 = 11

// Example 2:

// Input: nums = [1,2,3]
// Output: -1
// Explanation:
// There is no index that satisfies the conditions in the problem statement.

// Example 3:

// Input: nums = [2,1,-1]
// Output: 0
// Explanation:
// The pivot index is 0.
// Left sum = 0 (no elements to the left of index 0)
// Right sum = nums[1] + nums[2] = 1 + -1 = 0
 

// Constraints:

// 1 <= nums.length <= 104
// -1000 <= nums[i] <= 1000

class Solution { // [1,7,3,6,5,6]
    func pivotIndex(_ nums: [Int]) -> Int {
        var leftIndex: Int = -1 // slow index & -1 because it doesn't move until first rightIndex loop
        var rightIndex: Int = nums.count - 1
        
        var leftSum: Int = 0
        var rightSum: Int = 0
        
        while leftIndex + 1 < rightIndex { // index + 1 (has to have a pivot point) < than right index
            while rightIndex > leftIndex && leftIndex + 1 < rightIndex {
                rightSum = rightSum + nums[rightIndex] // 11
                if leftSum == rightSum {
                    return leftIndex + 1
                }
                rightIndex -= 1 // 4
            }
            rightIndex = nums.count - 1 // reset the inner loop
            rightSum = 0
            leftIndex += 1 // 2
            leftSum = leftSum + nums[leftIndex]
        }
        return -1 // If no such index exists, return -1. 
    }
}

// Thoughts:

// The idea here is we have a left side that is slower than the right side. The right side can be the entire array and left side not have an index and the pivot would be 0 as seen in example 3. Which means leftIndex < rightIndex. When we find the == sum it's the leftIndex that is the pivot, which is what is returned.count
