/* Subsets With Duplicate Characters

Given a string that might contain duplicate characters, find all the possible distinct subsets of that string.

Example One

{
"s": "aab"
}
Output:

["", "a", "aa", "aab", "ab", "b"]
Example Two

{
"s": "dc"
}
Output:

["", "c", "cd", "d"]
Notes

All the subset strings should be individually sorted.
The order of the output strings does not matter.
Constraints:

1 <= length of the string <= 15
String consists of lowercase English letters
*/

// Distinct meaning aab but not baa because `All the subset strings should be individually sorted` which means alpha ascending

// edge cases 
// - how many characters in a single string? max 15
// - are they always lowercase? yes

// Proposed solution:

// sort the string alpha ascending before passing to helper func

// from helper func we need to tree to look like

// a 	   a(x)  b
// |	   |	 |
// aa     ab
// |
// aab

// loop through each character in string

// 	base case is if index > choices.count

// 	excluding helper as well where slate is not appended

// 	choices is the remaining options after index

// 	append index to slate
// 	helper(index+1, choices)
// 	if index+1 is unique
// 		repeat
// 	else
// 		continue






// Complete the function below. 

// Complete the function below. 
func get_distinct_subsets(s: String) -> [String] {
    var slate = [Character]()
    var result = [String]()

	func helper(c: [Character], slate: inout [Character], index: Int) {
		result.append(String(slate))

	    for i in index ..< c.count {
	        if i > index, c[i-1] == c[i] { continue }

	        slate.append(c[i])
	        print(slate)
	        // let index = i + 1
	        helper(c: c, slate: &slate, index: i+1)

	        slate.removeLast()
	    }
	}

    helper(c: [Character](s).sorted(), slate: &slate, index: 0)
    
    return result
}

print("Result:", get_distinct_subsets(s: "aab"))
// ["s", "f", "fs", "ff", "ffs", "d", "ds", "df", "dfs", "dff", "dffs", ""]

// func get_distinct_subsets(s: String) -> [String] {

//     let characters = [Character](s).sorted()
//     var slate = [Character]()
//     var result = [String]()
//     var index = 0

// 	func helper(s: [Character], index: inout Int, remaining: Int, slate: inout [Character]) {
// 		print(s, index, remaining, slate)
// 		// backtrace
// 		if result.contains(String(slate)) {
// 			return
// 		}

// 		result.append(String(slate))
		
// 		// base case
// 		if index > s.count {
// 			return
// 		}

//         // incriment index after remainting is finished
// 		if remaining >= (s.count - index) {
// 			index += 1
// 			return
// 		}

// 		print(remaining, s.count)
// 		for i in remaining ... s.count-1 {

// 			slate.append(s[i])
// 			helper(s: s, index: &index, remaining: remaining+1, slate: &slate)
// 			slate.removeLast()
// 		}
// 	}

//     helper(s: characters, index: &index, remaining: 0, slate: &slate)

//     return result
// }

// original thought:

// func get_distinct_subsets(s: String) -> [String] {

//     let characters = [Character](s).sorted()

//     var slate = [Character]()
//     helper(s: characters, index: 0, slate: &slate, choices: [])

//     return result
// }


// func helper(s: [Character], index: Int, slate: inout [Character], choices: [Character]) {
// 	if index == s.count {
// 		// print(slate)
// 		result.append(String(slate))
// 		return
// 	}

// 	helper(s: s, index: index+1, slate: &slate, choices: [])

// 	slate.append(s[index])
// 	helper(s: s, index: index+1, slate: &slate, choices: [])
// 	slate.removeLast()

// }


// print(get_distinct_subsets(s: "aad"))