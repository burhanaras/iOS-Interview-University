/*
 EASY: Count And Say
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/886/
 
 The count-and-say sequence is a sequence of digit strings defined by the recursive formula:
 
 countAndSay(1) = "1"
 countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1), which is then converted into a different digit string.
 
 Given a positive integer n, return the nth term of the count-and-say sequence.
 
 
 */


func countAndSay(n: Int) -> String {
    var number = "1"
    
    for _ in 1..<n{
        number = count(number: number)
    }
    return number
}

func count(number: String) -> String {
    guard !number.isEmpty else { return ""}
    if number == "1"{
        return "11"
    }
    
    let numbers = Array(number)
    var result = ""
    var num = numbers[0]
    var counter = 1
    for index in 1..<numbers.count {
        if numbers[index] != numbers[index - 1] {
            result.append("\(counter)\(num)")
            num = numbers[index]
            counter = 1
        } else {
            counter += 1
        }
    }
    result.append("\(counter)\(num)")
    return result
}
/*
 Time complexity: O(n*M). n is given, M is number length
 Space Complexity: O(M), M is number length
 */

countAndSay(n: 4)

