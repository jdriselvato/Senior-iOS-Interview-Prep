// Cut The Rod To Maximize Profit

func get_maximum_profit(price: [Int]) -> Int {
    if price.count == 0 { return 0 }
    
    var table: [Int] = Array(repeating: 0, count: price.count+1)
    table[0] = 0 // base case
    
    for i in 1...price.count {
        table[i] = price[i - 1] // original price
        
        for j in 1...i { // find the new max price for rode size i
            table[i] = max(table[i], price[j-1]+table[i-j])
        }
    }
    
    return table[price.count]
}

let profit = get_maximum_profit(price: [1,5,8,9])
print(profit)


/// alternative student submission (the fastest)

func get_maximum_profit(price: [Int]) -> Int {
    if price.count == 0 { return 0 }
    
    // we'll store the max price at each rod length here
    var table: [Int] = Array(repeating: 0, count: price.count+1)
    table[0] = 0 // base case
    
    for i in 1...price.count { // rod length
        var result = 0 // current max price for this rod length
        for j in 1..<i {
            result = max(result, table[i-j-1] + price[j]) // max price
        }
        table[i] = result // store max price
    }

    return table[price.count]
}


let profit = get_maximum_profit(price: [1,5,8,9])
print(profit)

-----

// Find the minimum profit at inch `n` where n is size of price

func get_minimum_profit(price: [Int]) -> Int {
    if price.count == 0 { return 0 }
    
    var table: [Int?] = Array(repeating: nil, count: price.count+1)
    table[0] = 0 // base case
    
    for i in 1...price.count {
        table[i] = price[i - 1] // original price
        for j in 1...i { // find the new max price for rode size i
            table[i] = min(table[i] ?? Int.max, price[j-1]+(table[i-j] ?? 0))
        }
    }
    print(table)
    
    
    return table[price.count] ?? 0
}

let profit = get_minimum_profit(price: [1,5,8,9]) /// 4 because 1+1+1+1 at 4 inches
print(profit)
