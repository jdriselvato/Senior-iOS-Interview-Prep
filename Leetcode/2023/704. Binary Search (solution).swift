// 704. Binary Search
// https://leetcode.com/problems/binary-search/description/?envType=study-plan&id=algorithm-i

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var minIndex: Int = 0
        var maxIndex: Int = nums.count - 1
        
        while minIndex <= maxIndex {
            var guess = Int((minIndex + maxIndex) / 2)
            guard nums[guess] != target else { return guess }
            
            if nums[guess] < target {
                minIndex = guess + 1
            }
            if nums[guess] > target {
                maxIndex = guess - 1
            }
        }
        
        return -1
    }
}

let arr = [-1,0,3,5,9,12]
let target = 9
let s = Solution().search(arr, target)
print(s)

// Time complexity: O(logn)