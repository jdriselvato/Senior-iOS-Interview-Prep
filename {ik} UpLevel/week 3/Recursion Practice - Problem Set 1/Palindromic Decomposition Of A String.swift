// Palindromic Decomposition Of A String

// Find all palindromic decompositions of a given string s.

// A palindromic decomposition of string is a decomposition of the string into substrings, such that all those substrings are valid palindromes.

// Example

// {
// "s": "abracadabra"
// }
// Output:

// ["a|b|r|a|c|ada|b|r|a", "a|b|r|aca|d|a|b|r|a", "a|b|r|a|c|a|d|a|b|r|a"]
// Notes

// Any string is its own substring.
// Output should include ALL possible palindromic decompositions of the given string.
// Order of decompositions in the output does not matter.
// To separate substrings in the decomposed string, use | as a separator.
// Order of characters in a decomposition must remain the same as in the given string. For example, for s = "ab", return ["a|b"] and not ["b|a"].
// Strings in the output must not contain whitespace. For example, ["a |b"] or ["a| b"] is incorrect.
// Constraints:

// 1 <= length of s <= 20
// s only contains lowercase English letters.

// # Edge Case questions

// - Whats the max size of the string? 20
// - Can this string contain numbers? No only english letters

// # Compiling a solution

// The tree I'm invisioning takes index++ until string count to determine the choices. 

// If after middle of length isn't a palindrome, we can skip those and move to the next level of remaining string characters 

// do this each time until bottom leaf node for each off shoot.

// backtrack case will be if not palindrome, return.

// base case is if palindrome append to slate until no longer palindrome.

// How do we know it's a palindrome?
// 		two points 1. starting at 0; 2nd starting at count-1 check if they are equal 

// time complexity: O(2^n * n)

// space complexity: s(2^n * n)

func generate_palindromic_decompositions(s: String) -> [String] {

    var result = [String]()
    var slate = [String]()

    func helper(_ s: [Character], index: Int, slate: inout [String]) {
    	if index == s.count {
    		result.append(slate.joined(separator: "|")) // add | at the end
    		return
    	}


    	var tempPalin = ""
    	for i in index ... s.count-1 {
    		tempPalin += String(s[i])

    		if isPalindrome(s: s, from: index, to: i) {
    			slate.append(tempPalin)
    			helper(s, index: i+1, slate: &slate)
    			slate.removeLast()
    		}
    	}

    }

    helper([Character](s), index: 0, slate: &slate)

    return result
}

func isPalindrome(s: [Character], from: Int, to: Int) -> Bool {
	var i = from
	var j = to

	while i <= j {
		if s[i] != s[j] { // check left to right of arry
			return false
		}
		i += 1
		j -= 1
	}

	return true
}

print(generate_palindromic_decompositions(s: "abracadabra"))