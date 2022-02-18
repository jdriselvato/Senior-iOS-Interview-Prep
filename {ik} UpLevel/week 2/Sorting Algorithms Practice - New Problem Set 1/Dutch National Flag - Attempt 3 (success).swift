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

    var temp:[Character] = balls

    var rIndex = -1
    var gIndex = -1
    var index = 0

    while index <= temp.count-1 {

        if temp[index] == "G" {
            gIndex += 1 // because swap with blue
            print("G gIndex = ", gIndex)
            temp.swapAt(index, gIndex)
            print("G swap:", temp)
        }

        if temp[index] == "R" {
            gIndex += 1 // because swap with blue
            print("R gIndex = ", gIndex)
            temp.swapAt(index, gIndex)
            rIndex += 1
            print("R rIndex = ", rIndex)
            temp.swapAt(gIndex, rIndex)
            print("R swap:", temp)
        }

        index += 1

    }

    return temp

}

let flag: [Character] = ["G", "B", "R", "G", "B", "R", "G", "B", "R", "G", "B", "R", "G", "B", "R", "G", "B", "R", "G"]

let result = dutch_flag_sort(balls: flag)
print(result)



