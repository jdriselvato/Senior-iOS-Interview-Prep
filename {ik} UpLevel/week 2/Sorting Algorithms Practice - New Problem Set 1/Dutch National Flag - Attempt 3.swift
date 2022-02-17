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
    var index = 0
    var green = 0
    var blue = ballsArr.count-1
    
    while index <= blue {
        if ballsArr[index] == "R" {
            ballsArr.swapAt(index, green)
            // ballsArr[index] = "G"
            // ballsArr[green] = "R"

            green += 1
            index += 1

        } else if ballsArr[index] == "G" {
            index += 1

        } else {
            ballsArr[index] = ballsArr[blue-1]
            ballsArr[blue-1] = "B"

            blue -= 1

        }
    }
        
    return ballsArr
}

let flag: [Character] = ["G", "B", "R","G", "B", "R","G", "B", "R","G", "B", "R","G", "B", "R","G", "B", "R","G", "B", "R","G", "B", "R","G", "B", "R" ]

let result = dutch_flag_sort(balls: flag)
print(result)



