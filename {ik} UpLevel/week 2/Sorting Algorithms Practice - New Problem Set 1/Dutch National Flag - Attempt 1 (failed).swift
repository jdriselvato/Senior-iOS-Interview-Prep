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
    // Write your code here.
    var ballsArr = balls
    
    var i = 0
    var r = 0
    var g = 0 
    var b = 0
    
    // order needs to be R G B
    
    while i <= ballsArr.count-1 {
    	print("🔴 N E W L O O P")
        if ballsArr[i] == "R" {
        	r = i
        } 

        if ballsArr[i] == "G" {
        	g = i
        } 

        if ballsArr[i] == "B" {
        	b = i
        }

        if r > b  { // red swap back
        	ballsArr.swapAt(r, b)
        	r = b
        	// b = r
        	print("--------- swapping r > b 🔀")
        } else if r > g { // red swap back
        	ballsArr.swapAt(r, g)
        	r = g
        	// g = r 
        	print("--------- swapping r > g 🔀")
        } else if g > b { // green swap back
        	ballsArr.swapAt(g, b)
        	g = b
        	// b = g
        	print("--------- swapping g > b 🔀")
        } else if g < b { // green swap forward
        	ballsArr.swapAt(g, b)
        	g = b
        	// b = g 
        	print("--------- swapping g < b 🔀")
        }

        i += 1

        print("-- New:", ballsArr, "\n")

    }
    
    return ballsArr
}

let balls: [Character] = ["G", "B", "G", "G", "R", "B", "R", "G", "G", "B", "G", "G", "R"]
let result = dutch_flag_sort(balls: balls)
print(balls, "\nvs\n", result)



