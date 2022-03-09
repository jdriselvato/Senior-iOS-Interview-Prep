// Shortest String Transformation Using A Dictionary

// You are given a dictionary called words and two string arguments called start and stop. All given strings have equal length.

// Transform string start to string stop one character per step using words from the dictionary. For example, "abc" → "abd" is a valid transformation step because only one character is changed ("c" → "d"), but "abc" → "axy" is not a valid one because two characters are changed ("b" → "x" and "c" → "y").

// You need to find the shortest possible sequence of strings (two or more) such that:

// First string is start.
// Last string is stop.
// Every string (except the first one) differs from the previous one by exactly one character.
// Every string (except, possibly, first and last ones) are in the dictionary of words.
// Example One

// {
// "words": ["cat", "hat", "bad", "had"],
// "start": "bat",
// "stop": "had"
// }
// Output:

// ["bat", "bad", "had"]
// OR

// ["bat", "hat", "had"]
// In "bat", change "t" → "d" to get "bad".
// In "bad", change "b" → "h"to get "had".

// OR

// In "bat", change "b" → "h" to get "hat".
// In "hat", change "t" → "d" to get "had".

// Notes:
// If two or more such sequences exist, return any.
// If no such sequence is there to be found, ["-1"] (a sequence of one string, "-1") is the correct answer.

// Constraints:
// All input strings consist of lowercase English letters
// 0 <= total number of characters in all dictionary words combined <= 105
// Strings in words are not in any particular order
// There may be duplicates in words

func string_transformation(words: [String], start: String, stop: String) -> [String] {
	if words.isEmpty || Array(start).count == 1 { return [start, stop] } // Return start/stop if empty
	if start == stop { return ["-1"] } // No sequence of strings exists

	var startChars: [Character] = Array(start)
	let endChars: [Character] = Array(stop)

	var availableWords = words

	var wordsUsed = [String]()
	wordsUsed.append(start) // first word

	for i in 0...startChars.count-1 { 
		if startChars[i] != endChars[i] { // needs to change
			// cycle through each word 
			for j in 0...availableWords.count-1 { // j = word
				let wordChar: [Character] = Array(availableWords[j]) // word to charact array

				if wordChar[i] == endChars[i] { // usable transformation
					wordsUsed.append(availableWords[j])// add to words used
					startChars[i] = wordChar[i] // replace word in startChar

					availableWords.remove(at: j) // remove word from availableWords

					break // move to next character in startChars
				}
			}
		}
	}

	if wordsUsed.last != stop { // last transformation didn't complete it, add stop
		wordsUsed.append(stop)
	}


    return wordsUsed
}

let used = string_transformation(
	words: ["ggggnn", "gggnnn", "gggggn", "ggnnnn", "gnnnnn"], 
	start: "gggggg", 
	stop: "nnnnnn")
print(used) 