// https://leetcode.com/problems/fizz-buzz/description/

// 412. Fizz Buzz

// Given an integer n, return a string array answer (1-indexed) where:

// answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
// answer[i] == "Fizz" if i is divisible by 3.
// answer[i] == "Buzz" if i is divisible by 5.
// answer[i] == i (as a string) if none of the above conditions are true.


class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var output: [String] = []
        for i in 1...n {
            if i%3 == 0 && i%5 == 0 {
                output.append("FizzBuzz")
            } else if i%3 == 0 {
                output.append("Fizz")
            } else if i%5 == 0 {
                output.append("Buzz")
            } else {
                output.append(String(i))
            }
        }
        return output
    }
}

// Time complexity O(n)
// Space complexity O(n) because of the array

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var output: [String] = []
        for i in 1...n {
            let isFizz = i%3 == 0
            let isBuzz = i%5 == 0
            
            if isFizz && isBuzz {
                output.append("FizzBuzz")
            } else if isFizz {
                output.append("Fizz")
            } else if isBuzz {
                output.append("Buzz")
            } else {
                output.append(String(i))
            }
        }
        return output
    }
}