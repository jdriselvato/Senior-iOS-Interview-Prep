// Count Ways To Reach The Nth Step

// There is a staircase with n steps. A person standing at the 0-th step wants to reach the n-th one. They are capable of jumping up by certain numbers of steps at a time.

// Given how the person can jump, count the number of ways they can reach the top.

// Example One

// {
// "steps": [1, 2],
// "n": 1
// }
// Output:

// 1
// The person can jump up by either 1 or 2 steps at a time. The only way to reach step 1 from step 0 is to jump up one step once.

// Example Two

// {
// "steps": [1, 2],
// "n": 2
// }
// Output:

// 2
// There are two distinct ways to reach step 2: {1, 1}, {2}.

// Example Three

// {
// "steps": [2, 3],
// "n": 7
// }
// Output:

// 3
// There are three distinct ways to reach step 7 from step 0: {2, 2, 3}, {2, 3, 2}, {3, 2, 2}.

// Notes

// Constraints:

// 1 <= n <= 10000
// 1 <= length of the given list steps <= 100
// 1 <= element of the given list steps <= 10000
// Answer will fit in a 64-bit integer

func count_ways_to_climb(steps: [Int], n: Int) -> Int {
    
    var table: [Int?] = Array(repeating: 0, count: n+1)
    table[0] = 0
    for step in steps {
        if step < table.count {
            table[step] = 1 
        }
    }

    for i in 0...n {
        for step in steps {
            if step < table.count && i >= step { 
                print(table[i], i, step)
                table[i] = table[i]! + table[i-step]!
            }
        }
    }
    
    return table[n]!
}

print(count_ways_to_climb(steps: [3,4,5], n: 3))


// After completion thoughts:

// I lost a lot of time due to not knowing the different between:
// 	table[i] = table[i] ?? 0 + 1 
// vs
// 	table[i] = (table[i] ?? 0) + 1 

// For whatever reason, without the () it breaks. it doesn't add.

// First attempt: 1:09:13