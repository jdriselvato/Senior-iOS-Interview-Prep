// Minimum 

func makeChange(index: Int, amount: Int, coins: [Int]) -> Int {
    if amount < 0 { return 0 }
    if index < 0 { return amount == 0 ? 1 : 0 }
    
    let modulo = 1000000007 // "Assume infinite supply of coins of every denomination. Return answer modulo 1000000007."
    
    var result: Int = makeChange(index: index, amount: amount-coins[index], coins: coins)
    result = (result + makeChange(index: index-1, amount: amount, coins: coins)) % modulo
    
    return result
}


func number_of_ways(coins: [Int], amount: Int) -> Int {
    return makeChange(index: coins.count-1, amount: amount, coins: coins)
}

print("answer:", number_of_ways(coins: [1,2,3], amount: 20))

