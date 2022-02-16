// Segregate Even And Odd Numbers

/*Given an array of numbers, rearrange them in-place so that even numbers appear before odd ones.

Example:

{
"numbers": [1, 2, 3, 4]
}

Output:[4, 2, 3, 1]

The order within the group of even numbers does not matter; same with odd numbers. So the following are also correct outputs: [4, 2, 1, 3], [2, 4, 1, 3], [2, 4, 3, 1].

Notes

It is important to practice solving this problem by rearranging numbers in-place.
There is no need to preserve the original order within the even and within the odd numbers.
We look for a solution of the linear time complexity that uses constant auxiliary space.
Constraints:

1 <= length of the array <= 105
1 <= element of the array <= 109
*/


func segregate_evens_and_odds(numbers: [Int]) -> [Int] {
    if numbers.isEmpty { return [] }
    var temp: [Int] = numbers

    var left = 0
    var right = temp.count-1

    while left < right {

        if temp[left] % 2 != 0 && temp[right] % 2 == 0 {
            temp.swapAt(left, right)
            left += 1
            right -= 1
        } else {
            if temp[left] % 2 == 0 {
                left += 1
            }

            if temp[right] % 2 != 0 {
                right -= 1
            }
        }
    }

    return temp
}


let seg = segregate_evens_and_odds(numbers: [0,10,-1,-2,3,4,53,301,20,8,7])
print(seg)

