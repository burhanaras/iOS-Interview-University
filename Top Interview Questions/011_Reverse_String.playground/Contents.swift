/*
 EASY: Reverse String
 LeetCode: https://leetcode.com/explore/featured/card/top-interview-questions-easy/127/strings/879/
 
 Write a function that reverses a string. The input string is given as an array of characters s.

 You must do this by modifying the input array in-place with O(1) extra memory.

  

 Example 1:

 Input: s = ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 Example 2:

 Input: s = ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]
  
 */

import XCTest

func reverseString(_ s: inout [Character]) {
    var left = 0
    var right = s.count - 1
    
    while right > left {
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        
        left += 1
        right -= 1
    }
}
/*
 Time complexity: O(N)
 Space complexity: O(1)
 */

var string = Array("hello")
reverseString(&string)
var expected: [Character] = ["o","l","l","e","h"]
XCTAssertEqual(expected, string)

var input: [Character] = ["H","a","n","n","a","h"]
reverseString(&input)
expected = ["h","a","n","n","a","H"]
XCTAssertEqual(expected, input)
