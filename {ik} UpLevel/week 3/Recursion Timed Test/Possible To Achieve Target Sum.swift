
func check_if_sum_possible(arr: [Int], k: Int) -> Bool {
    var slate = [Int]()
    var hasSum = false
    
    func helper(arr: [Int], index: Int, k: Int, slate: inout [Int]) {
        if arr.count == 1 && arr[0] != k {
            hasSum = false
            return
        }
        
        if index == arr.count {
            if equals(k: k, slate: slate) && !slate.isEmpty {
                hasSum = true
             return 
            }
            return
        }
        
        // excluding
        helper(arr: arr, index: index+1, k: k, slate: &slate)
        
        // including
        slate.append(arr[index])
        helper(arr: arr, index: index+1, k: k, slate: &slate)
        slate.removeLast()
    }
    helper(arr: arr, index: 0, k: k, slate: &slate)
    
    return hasSum
}

func equals(k: Int, slate: [Int]) -> Bool {
    if slate.isEmpty { return false }

    var sum = 0

    for i in slate {
        sum = sum + i
    }

    if sum == k {
        return true
    }
    
    return false
}

print(check_if_sum_possible(arr: [10, 20], k: 0))