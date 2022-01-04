/*
 EASY: reverse Integer
 LeetCode: https://leetcode.com/explore/featured/card/top-interview-questions-easy/127/strings/880/
 
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-2^31, 2^31 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:
 Input: x = 123
 Output: 321
 
 Example 2:
 Input: x = -123
 Output: -321
 
 Example 3:
 Input: x = 120
 Output: 21
 */


func reverse(_ x: Int) -> Int {
    var number = abs(x)
    let isNegative = x < 0
    var reversed = 0
    while number > 0 {
        let theLastDigit = number % 10
        number = number / 10
        reversed = reversed * 10 + theLastDigit
    }
    
    return isNegative ? -reversed : reversed
}

/*
 Time complexity: O(N) Linear time. N is the digit count of X
 Space complexity: O(1) Constant space.
 */

reverse(123)
reverse(-123)
reverse(120)
reverse(1202)
