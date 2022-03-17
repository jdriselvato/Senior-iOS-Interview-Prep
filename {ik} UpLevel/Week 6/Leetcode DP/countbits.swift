class Solution {
    func countBits(_ n: Int) -> [Int] {
        if n == 0 { return [0] }

        var count = [0, 1]

        var table: [Int?] = Array(repeating: nil, count: n)

        for i in 2..<n {
            let n1 = i >> 1
            let n2 = i % 2
            table[i] 
        }
    }
}