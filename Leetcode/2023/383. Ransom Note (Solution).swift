// # 383. Ransom Note

// Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

// Each letter in magazine can only be used once in ransomNote.

// Example 1:

// Input: ransomNote = "a", magazine = "b"
// Output: false
// Example 2:

// Input: ransomNote = "aa", magazine = "ab"
// Output: false
// Example 3:

// Input: ransomNote = "aa", magazine = "aab"
// Output: true
 

// Constraints:

// - 1 <= ransomNote.length, magazine.length <= 10^5
// - ransomNote and magazine consist of lowercase English letters.


class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        var dict: [Character: Int] = [:]
        for c in Array(magazine) {
            dict[c] = 1 + (dict[c] ?? 0)
        }

        for c in Array(ransomNote) {
            if let value = dict[c] {
                dict[c] = value - 1
                if dict[c] == -1 {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}

// Time C: O(n + m)
// Space: O(m)