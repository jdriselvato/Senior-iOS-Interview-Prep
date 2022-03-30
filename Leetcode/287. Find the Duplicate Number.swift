class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var fast = 0
        var slow = 0
        
        repeat {
            fast = nums[nums[fast]]
            slow = nums[slow]
        } while fast != slow
        
        slow = 0
        
        while fast != slow {
            fast = nums[fast]
            slow = nums[slow]
        }
        
        return fast
    }
}

Solution().findDuplicate([1,3,4,2,2]) // 2