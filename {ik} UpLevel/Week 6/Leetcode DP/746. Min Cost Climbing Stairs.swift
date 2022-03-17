746. Min Cost Climbing Stairs

You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.

 

Example 1:

Input: cost = [10,15,20]
Output: 15
Explanation: You will start at index 1.
- Pay 15 and climb two steps to reach the top.
The total cost is 15.


class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        if cost.isEmpty { return 0 }

        var table: [Int?] = Array(repeating: nil, count: cost.count+1)
        table[0] = 0
        table[1] = cost[0] // 10

        // [0, 10, 15, _]

        for i in 2..<cost.count {

        	table[i] = min(table[i-1] + cost[i-1], table[i-2] + cost[i-1])
        }

        return table[cost.count]
    }
}

Solution().minCostClimbingStairs([10,15,20])