/*Words From Phone Number

Given a seven-digit phone number, return all the character combinations that can be generated according to the following mapping:

Graph

Return the combinations in the lexicographical order.

Example

{
"phone_number": "1234567"
}
Output:

[
"adgjmp",
"adgjmq",
"adgjmr",
"adgjms",
"adgjnp",
...
"cfilns",
"cfilop",
"cfiloq",
"cfilor",
"cfilos"
]
First string "adgjmp" in the first line comes from the first characters mapped to digits 2, 3, 4, 5, 6 and 7 respectively. Since digit 1 maps to nothing, nothing is appended before 'a'. Similarly, the fifth string "adgjnp" generated from first characters of 2, 3, 4, 5 second character of 6 and first character of 7. All combinations generated in such a way must be returned in the lexicographical order.

Notes

Return an array of the generated string combinations in the lexicographical order. If nothing can be generated, return an array with one string "-1".
Digits 0 and 1 map to nothing. Other digits map to either three or four different characters each.
Constraints:

Input string is 7 characters long; each character is a digit.*/


// Can 0 and 1 be sent? yes
// can 0 or 1 be in the middle? yes
// What's the max amount of numbers? unknown

// brute force loop through each string then loop through each corresponding dictionary entry. but this should be recursive.

// How many blocks? n; n numbers == n returned
// how many choices 10; 0 to 9 even if 0 & 1 return nothing 

// choices mean for loops some times 

// for loop that goes through each number - index
// get the diction character array of keymaps
// slate append(dict.arr[jndex])
// call helper inside we use a secondary index that goes through each keymaps
// when index is < keymap dict array count return
// origina loop with increment 

let keyMap: [Character: [Character]] = [
	"1": [],
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h", "i"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z"],
    "0": []
]

var results = [String]()

func get_words_from_phone_number(phone_number: String) -> [String] {
	var slate = [Character]()
    
    let nums = [Character](phone_number).filter({$0 != "0" && $0 != "1"}) // remove 0 & 1
    helper(nums: nums, index: 0, slate: &slate)

    return results
}

func helper(nums: [Character], index: Int, slate: inout [Character]) {
	guard !nums.isEmpty else { 
		results.append("-1")
		return
	}
	// base case
	if index == nums.count {
		results.append(String(slate))
		return
	}

	let inputNumber = nums[index]
	let mapItem = keyMap[inputNumber, default: []]

	if mapItem.count == 0 {
		helper(nums: nums, index: index+1, slate: &slate)
	} else {
	    mapItem.forEach { key in
	        slate.append(key)
	        helper(nums: nums, index: index+1, slate: &slate)
	        slate.removeLast()
	    }
	}
}

let r = get_words_from_phone_number(phone_number: "1234")
print(r)


// func get_words_from_phone_number(phone_number: String) -> [String] {

//     let phoneMap = [0: "", 1: "", 2: "abc", 3: "def", 4: "ghi", 5: "jkl", 6: "mno", 7: "pqrs", 8: "tuv", 9: "wxyz"]
//     let input: [Int] = phone_number.compactMap{ Int(String($0)) }
//     var slate: String = ""
//     var results: [String] = []
//     helper(phoneMap, input: input, index: 0, slate: &slate, results: &results)
//     return results
// }
//  func helper(_ map: [Int: String], input: [Int], index: Int, slate: inout String, results: inout [String]) {

//      guard index < input.count else {
//         results.append(slate.isEmpty ? "-1" : slate)
//          return
//      }
//     let inputNumber = input[index]
//     let mapItem = map[inputNumber, default: ""]
//     if mapItem.count == 0 {
//         helper(map, input: input, index: index+1, slate: &slate, results: &results)
//     } else {
//         mapItem.forEach {
//             slate.append(String($0))
//             helper(map, input: input, index: index+1, slate: &slate, results: &results)
//             slate.removeLast()
//         }
//     }
//  }

//  print(get_words_from_phone_number(phone_number: "123"))