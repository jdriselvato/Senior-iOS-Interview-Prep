// 387. First Unique Character in a String

// Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict: [Character: Int] = [:]

        for c in Array(s) {
            dict[c] = dict[c, default: 0] + 1
        }

        for (i, c) in Array(s).enumerated() {
            if dict[c] == 1 {
                return i
            }
        }
        return -1
    }
}