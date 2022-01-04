/*
 EASY: Valid Palindrome
 LeetCode: https://leetcode.com/explore/featured/card/top-interview-questions-easy/127/strings/883/
 
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.

  

 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 
 Example 3:
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
  
 */


func isPalindrome(s: String) -> Bool {
    if s.isEmpty { return true }
    var letters = [Character]()
    for letter in s.lowercased() {
        if letter != " " && letter != "," && letter != ":" && letter != "." {
            letters.append(letter)
        }
    }
    letters
    var left = 0
    var right = letters.count - 1
    while right > left {
        if letters[left] != letters[right] {
            return false
        }
        
        left += 1
        right -= 1
    }
    return true
}
/*
 Time Complexity: O(N)
 Space Complexity: O(N)
 */

var input = "A man, a plan, a canal: Panama"
isPalindrome(s: input)

input = "race a car"
isPalindrome(s: input)

input = ""
isPalindrome(s: input)
