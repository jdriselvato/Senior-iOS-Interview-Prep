// Higher order functions in Swift: Filter, Map, Reduce, flatmap, compactMap
import Foundation

/// Map

class Mapping {
    func run() {
        var array = [1,2,3,4,5].map { $0 * 10 } // multiply by 10
        print("Mapping:", array)
        
        var dict = [
            "I": 1, "II": 2, "III": 3
        ].map { key, value in
            return key.lowercased() // lowercase
        }
        print("Mapping:", dict)
    }
}
Mapping().run()

/// Filter

class Filtering {
    func run() {
        var array = [1,2,3,4,5].filter { $0 % 2 == 0 } // keep only even
        print("Filter only %2:", array)
        
        var dict = [
            "I": 1, "II": 2, "III": 3
        ].filter { key, value in
            return value != 3 // filter out 3
        }
        print("Filter out 3:", dict)
    }
}
Filtering().run()

/// Reduce and compactMap

class Reducing {
    func run() {
        var arrayTotal = [1,2,3,4,5].reduce(0) { x, y in
            return x + y // add up all the numbers
        }
        print("Reduced to total:", arrayTotal)
        
        var dictSum = [
            "Apple": 1, "Orange": 2, "Grape": 3
        ].compactMap { $0.value }.reduce(0, +)
        print("Total fruit:", dictSum)
    }
}
Reducing().run()

/// FlatMap
class FlatMapping {
    func run() {
        var dicts = [
            [1,2,3,4],
            [4,6,7,8],
            [9, 10, 11, 12]
        ]
        let combined = dicts.flatMap { $0.map { $0 } } // combine both dictionary collections
        print("Combine:", combined)
        
        // combine and filter to only display even
        let onlyEven = dicts.flatMap { $0.filter { $0 % 2 == 0 } }
        print("Only even:", onlyEven)
        
        // using flatmap to remove nils
        var array = [1,2,nil,4,5,6,nil].flatMap({ $0 })
        print("No nils:", array)
    }
}
FlatMapping().run()


/// The difference between compactMap and flatMap

//    - compactMap will remove nils
//    - flatMap transform collection (dict of dicts) into a sequence (single dict)
