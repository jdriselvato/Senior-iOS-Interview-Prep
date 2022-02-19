#!/usr/bin/env swift
import Foundation

// Recursive Procedures: Towers of Hanoi

// Procedure - a function that does not return a result
//
//		Sorting is an example of a procedure because we are doing something to the array not returning the array. `inout`

/*

Three pegs move all discs to b. a small disc can not be under a larger disc. Swap to move A -> B in same stacking order

Start:
	|			|			|
   ---			|			|
	|			|			|
  -----			|			|
	|			|			|
---------		|			|	
							
	A 			B 			C

Finish:

	|			|			|
	|		   ---			|
	|			|			|
	|		  -----			|
	|			|			|
	|		---------		|	
							
	A 			B 			C


*/

// This can be solved via a decrease and conquer
//
//		- Since at the top level (me) all I want to do is move the largest in A to B. Meaning the underlings will worry about moving the smaller ones on top.
//		- Also note, in order for largest to move form A to B, all of the other disc must be in order at C and B will be empty.


// Video's psuedo code

func Helper(n: Int, src: String, dest: String, aux: String) -> Int {

	var count = 0

	func towerOfHanoi(n: Int, src: String, dest: String, aux: String) { // O(2^n) or Exponential time
		if n == 1 {
			// print("\tMove disc from", src, "to", dest)
			count += 1
			return
		}

		towerOfHanoi(n: n-1, src: src, dest: aux, aux: dest)
		// print("\tMove disc from", src, "to", dest)
		count += 1
		towerOfHanoi(n: n-1, src: aux, dest: dest, aux: src)
	}

	towerOfHanoi(n: n, src: src, dest: dest, aux: aux)

	return count
}

print("Instructions with 3 discs:")
_ = Helper(n: 3, src: "A", dest: "B", aux: "C")

print("Instructions with 5 discs:")
let count = Helper(n: 8, src: "A", dest: "B", aux: "C")
print("Took", count, "moves")

// This is an example of depth first because we go down a single lane (left) first then it's right 
