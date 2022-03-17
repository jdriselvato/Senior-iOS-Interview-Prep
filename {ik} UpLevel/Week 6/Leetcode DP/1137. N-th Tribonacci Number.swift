// 1137. N-th Tribonacci Number


class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 || n == 1 { return n }
        if n == 2 { return 1 }
        
        var table: [Int?] = Array(repeating: nil, count: n+1)
        table[0] = 0
        table[1] = 1
        table[2] = 1
        
        for i in 3...n {
            table[i] = (table[i-1] ?? 0) + (table[i-2] ?? 0) + (table[i-3] ?? 0)
        }
        
        return table[n]!
    }
}

print(Solution().tribonacci(25))
