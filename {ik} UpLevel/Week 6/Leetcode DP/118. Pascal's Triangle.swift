// 118. Pascal's Triangle

Example 1:

Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

# My answer:

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 1 { return [[1],[1,1]] }
        var result: [[Int]] = Array(repeating: [], count: numRows)
        result[0] = [1]
        result[1] = [1,1]
        
        for i in 2...numRows-1 {
            for j in 0...i {
                if j == 0 {
                    result[i].append(1)
                } else if j == i {
                    result[i].append(1)
                } else {
                    let num = result[i-1][j] + result[i-1][j-1]
                    result[i].append(num)
                }
            }
        }
        
        return result
    }
}

print(Solution().generate(1))


# Optimized Submission:

