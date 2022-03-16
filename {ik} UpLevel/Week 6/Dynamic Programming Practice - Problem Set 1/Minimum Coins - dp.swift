// Minimum 

func makeChange(index: Int, amount: Int, coins: [Int]) -> Int {
    if amount < 0 { return 0 }
    if index < 0 { return amount == 0 ? 1 : 0 }
    
    let modulo = 1000000007 // "Assume infinite supply of coins of every denomination. Return answer modulo 1000000007."
    
    var result: Int = makeChange(index: index, amount: amount-coins[index], coins: coins)
    result = (result + makeChange(index: index-1, amount: amount, coins: coins)) % modulo
    
    return result
}


let modulo = 1000000007 // "Assume infinite supply of coins of every denomination. Return answer modulo 1000000007."

func number_of_ways(coins: [Int], amount: Int) -> Int {
    if amount < 0 { return 0 }
    
    var table: [[Int?]] = Array(repeating: Array(repeating: nil, count: amount+1), count: coins.count)
    
    for i in 0..<coins.count {
        for j in 0...amount {
            if j == 0 {
                table[i][0] = 1
            } else { 
                if i > 0 {
                    table[i][j] = table[i-1][j]
                }
                
                if j - coins[i] >= 0 {
                    table[i][j] = (
                        (table[i][j] ?? 0) + (table[i][j-coins[i]] ?? 0)
                    ) % modulo
                }
                
            }
        }
    }
        
    return table[coins.count-1][amount]!
}