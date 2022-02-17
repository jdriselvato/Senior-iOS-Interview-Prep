// Dutch National Flag

/* Given some balls of three colors arranged in a line, rearrange them such that all the red balls go first, then green and then blue ones.

Do rearrange the balls in place. A solution that simply counts colors and overwrites the array is not the one we are looking for.

This is an important problem in search algorithms theory proposed by Dutch computer scientist Edsger Dijkstra. Dutch national flag has three colors (albeit different from ones used in this problem).

Example

{
"balls": ["G", "B", "G", "G", "R", "B", "R", "G"]
}
Output:

["R", "R", "G", "G", "G", "G", "B", "B"]
There are a total of 2 red, 4 green and 2 blue balls. In this order they appear in the correct output.

Notes

Constraints:

1 <= n <= 100000
Do this in ONE pass over the array, NOT TWO passes
Solution is only allowed to use constant extra memory 
*/


func dutch_flag_sort(balls: [Character]) -> [Character] {
    guard !balls.isEmpty else { return [] }

    var ballsArr = balls

    var r = 0
    var i = 0

    var b = ballsArr.count-1
    var j = ballsArr.count-1


    while i <= ballsArr.count-1 && j >= 0 && r <= ballsArr.count-1 && b >= 0 {
        // print("🔴index:", i, "Value:", ballsArr[i])
        if i <= ballsArr.count-1 && ballsArr[i] == "R" {
            print("\tr point:", r)
            ballsArr.swapAt(i, r)
            print("\tRED swapping", ballsArr)
            r += 1
            i += 1

        } else {
            j -= 1
        }

        // print("🔵index:", j, "Value:", ballsArr[j])
        if j >= 0 && ballsArr[j] == "B" {
            print("\tb point:", b)
            ballsArr.swapAt(j, b)
            print("\tBLUE swapping", ballsArr)
            b -= 1
            j -= 1

        } else {
            i += 1
        }
        
    }
    
    return ballsArr
}

let balls: [Character] = ["G", "G", "B", "B", "R", "R"]
let result = dutch_flag_sort(balls: balls)
print(balls, "\nvs\n", result)



