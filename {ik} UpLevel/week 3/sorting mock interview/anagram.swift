/*Given an array of strings strs, group the anagrams together. You can return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

 

Example 1:

Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Example 2:

Input: strs = [""]
Output: [[""]]

Example 3:

Input: strs = ["a"]
Output: [["a"]]

----

what is the time comp

go through elem in arr // o(n)
    elem.sorted() // O(nlogn)
    O(nlogn)
    
    
what is the space comp

s(n) = s(n) // size of array
*/
   
   
func ana(_ arr: [String]) -> [[String]] {
    var result = [[String]]()
    var dict = [String: [String]]()
    
    for word in arr {
        let sorted = String(word.sorted()) // nlogn
        dict[sorted, default: [String]()].append(word)
    }
    
    // convert dict to array [[string]]
    for (_, value) in dict {
        result.append(value)
    }
    
    return result
}

print(ana(["eat","tea","tan","ate","nat","bat"]))