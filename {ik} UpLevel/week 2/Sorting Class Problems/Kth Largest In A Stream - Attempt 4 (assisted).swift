func kth_largest(k: Int, initial_stream: [Int], append_stream: [Int]) -> [Int] {
    // Write your code here.
    var temp: [Int] = []
    
    // if temp.count > k {
    //     temp = Array(initial_stream.dropLast(initial_stream.count - k))
    // } else {
    //     temp = initial_stream
    // }

    temp = initial_stream.sorted(by: >)

    var result: [Int] = []

    var index = 0

    for i in 0 ... append_stream.count-1 {

        temp.append(append_stream[i]) // add to end
   
        print("Before:", temp)
        insertionSort(sortingArray: &temp)
        print("After:", temp)

        // if temp.count > k {
        //     temp = Array(initial_stream.dropLast(initial_stream.count - k))
        // }

        result.append(temp[k-1]) // get the kth largest

        index -= 1
    }

    return result
}

func insertionSort(sortingArray: inout [Int]) {

    var index = 0
    
    // compare if the temp is smaller until it's bigger than an number and get it's index.
    guard let temp = sortingArray.last else { return }

    while index < sortingArray.count-1 {
        // print("Temp:\(temp) | against \(sortingArray[index])")
        if temp > sortingArray[index] {
            sortingArray.insert(temp, at: index)
            _ = sortingArray.removeLast() // remove temp from last
            // print("Inserted: \(sortingArray)")
            break
        }    
        index += 1
    }
}


let initial = [4, 6]
let appended =  [5, 2, 20]
let k = 2
let answer = [5, 5, 6]

let r = kth_largest(
    k: k, 
    initial_stream: initial, 
    append_stream: appended
    )
print("kMax: ", r, r == answer)
