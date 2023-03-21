// 1880. Check if Word Equals Summation of Two Words

// Constraints:

// 1 <= firstWord.length, secondWord.length, targetWord.length <= 8

// firstWord, secondWord, and targetWord consist of lowercase English letters from 'a' to 'j' inclusive.

class Solution {
    let letterDict: [Character: Int] = {
        let lettersArray = Array("abcdefghij...z")
        var dict: [Character: Int] = [:]
        for (i, letter) in lettersArray.enumerated() {
            dict[letter] = i
        }
        return dict
    }()
    
    func isSumEqual(_ firstWord: String, _ secondWord: String, _ targetWord: String) -> Bool {
        if converToNumber(firstWord) + converToNumber(secondWord) == converToNumber(targetWord) {
            return true
        }
        return false
    }
    
    func converToNumber(_ word: String) -> Int {
        var str = ""
        for letter in Array(word) {
            str += String(letterDict[letter] ?? 0)
        }
        return Int(str) ?? 0
    }
}


