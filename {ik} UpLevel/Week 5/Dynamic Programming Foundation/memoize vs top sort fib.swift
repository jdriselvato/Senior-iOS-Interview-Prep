import Foundation

// MARK: - Clock

func calculateTime(name: String?, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print(name ?? "", "Time: \(timeInterval) seconds")
}

// MARK: - Top sort fib

func fib(_ n: Int) -> Int {
    if n == 0 || n == 1 { return n } // base case
    
    // Initialize cache
    var table = [Int?](repeating: nil, count: n+1)
    table[0] = 0 // constants
    table[1] = 1 // constants
    
    for i in 2...n { // loop
        guard let a = table[i-1], let b = table[i-2] else { continue }
        table[i] = a + b
    }
    return table[n]!
}

calculateTime(name: "Fib_1", block: {
    print(fib(10))
})

// MARK: - Memoize fib

var memo = [Int: Int]() // hashmap
memo[0] = 0
memo[1] = 1

func fib2(_ n: Int) -> Int {
    // it's stored so use it
    if let value = memo[n] {
        return value
    }
    
    memo[n] = fib2(n-1)+fib(n-2)
    return memo[n]!
}

calculateTime(name: "Fib_2", block: {
    print(fib2(10))
})
