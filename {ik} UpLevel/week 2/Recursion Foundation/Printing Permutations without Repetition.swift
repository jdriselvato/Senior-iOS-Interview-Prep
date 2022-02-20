#!/usr/bin/env swift
import Foundation

// Printing Permutations without Repetition

/* Examples:

Given a set (or string) with n distinct characters, print all permutations (of size n, no repetitions allowed)

input: abc

output: abc, acb, bac, bca, cab, cba

possible number of permutations is `n!` (n factorial)


n, n-1, n-2, .... 1 = n!

_ _ _ _ _ _ _ (n blanks)

*/

class OptionOne {

	var perms: [String] = []
	func permHelper(_ slate: String, chars: [String]) {

		if chars.isEmpty { 
			perms.append(slate)
			return 
		} // base case

		for i in 0 ... chars.count-1 {
			let left: [String] = Array(
				chars[0..<i]
			)

			let right: [String] = {
				if i+1 <= chars.count-1 {
					let range = chars[i+1...(chars.count-1)]
					return Array(range)
				} else {
					return []
				}
			}()

			let aux = left + right
			let newSlate = slate + chars[i]

			permHelper(newSlate, chars: aux)

		}
	}

}

let one = OptionOne()
one.permHelper("", chars: ["a", "b", "c", "d"])
print(one.perms, "\n", one.perms.count)