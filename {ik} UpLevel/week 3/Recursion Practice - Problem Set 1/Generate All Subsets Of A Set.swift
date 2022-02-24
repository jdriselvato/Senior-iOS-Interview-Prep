/*
Generate All Subsets Of A Set

Generate ALL possible subsets of a given set. The set is given in the form of a string s containing distinct lowercase characters 'a' - 'z'.

Example

{
"s": "xy"
}
Output:

["", "x", "y", "xy"]

Notes

Any set is a subset of itself.
Empty set is a subset of any set.
Output contains ALL possible subsets of given string.
Order of strings in the output does not matter. E.g. s = "a", arrays ["", "a"] and ["a", ""] both will be accepted.
Order of characters in any subset must be same as in the input string. For s = "xy", array ["", "x", "y", "xy"] will be accepted, but ["", "x", "y", "yx"] will not be accepted.
Constraints:

0 <= length of s <= 19
s only contains distinct lowercase English letters.
*/

/*
Questions about the problem:
1. does order of the output matter? no
2. what is the max length of the string? 19
3. is xy == yx? no 

iterate through each character with a recursive function

we'll have two recursive calls:
- one including (index-1)
- one excluding (index)

for including we'll need a slate to append each subset

What is the base case?

when index == count append and return but how does that work for excluding. How do we return on that?

Time complexity:
2^n for the recursion time n elements in array O(2^n * n)
*/


func generate_all_subsets(s: String) -> [String] {

    var slate = [Character]()
    var result = [String]()

    func helper(_ s: [Character], index: Int, slate: inout [Character]) {
    	if index == s.count {
    		result.append(String(slate))
    		return
    	}

    	// // exclude
    	helper(s, index: index+1, slate: &slate)

    	// // include
    	slate.append(s[index])
    	helper(s, index: index+1, slate: &slate)
    	slate.removeLast()
    }

    let characters = [Character](s)

    helper(characters, index: 0, slate: &slate)

    return result
}

print(generate_all_subsets(s: "xy"))