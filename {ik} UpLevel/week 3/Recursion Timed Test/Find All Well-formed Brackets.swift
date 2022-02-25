
func find_all_well_formed_brackets(n: Int) -> [String] {
    let length = 2*n
    var result = [String]()
    var slate = [Character]()
    
    func helper(n: Int, index: Int, slate: inout [Character]) {
        if index == n {
            if slate[0] == Character(")") { return }
            if slate[n-1] == Character("(") { return }
            if isValid(slate: String(slate)) {
                result.append(String(slate))
            }
            return
        }
        
        slate.append(Character("("))
        helper(n: n, index: index+1, slate: &slate)
        slate.removeLast()

        slate.append(Character(")"))
        helper(n: n, index: index+1, slate: &slate)   
        slate.removeLast()
    }
    
    helper(n: length, index: 0, slate: &slate)
    
    return result
}

func isValid(slate: String) -> Bool {
    var sum = 0
    for b in slate {
        if b == "(" {
            sum = sum + 1
        } else {
            sum = sum - 1
            if sum < 0 { return false }
        }
    }
    return sum == 0
}

print(find_all_well_formed_brackets(n: 4))