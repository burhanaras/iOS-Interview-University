/*
 EASY:  Implement strStr()
 Leetcode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/885/
 
 Implement strStr().

 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

  

 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 Example 3:

 Input: haystack = "", needle = ""
 Output: 0
 */


func strStr(hayStack: String, needle: String) -> Int {
    guard !needle.isEmpty && !hayStack.isEmpty else { return 0 }
    let hayStack = Array(hayStack)
    let needle = Array(needle)
    
    let thefirstChar = needle[0]
    
    for index in 0..<hayStack.count {
        if hayStack[index] == thefirstChar && hayStack.count - 1 - index >= needle.count {
            var i = index + 1
            var j = 1
            var theyAreSame = true
            while j < needle.count{
                if hayStack[i] != needle[j] {
                    theyAreSame = false
                    break
                }
                i += 1
                j += 1
            }
            
            if theyAreSame {
                return index
            }
        }
    }
    
    return -1
}
/*
 Time complexity: O(N*M). N is haystack length, M is needle length
 Space complexity: O(N+M). N is haystack length, M is needle length.
 */

strStr(hayStack: "hello", needle: "ll")
strStr(hayStack: "aaaaa", needle: "ba")
strStr(hayStack: "", needle: "")
