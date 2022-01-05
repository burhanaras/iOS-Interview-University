/*
 EASY: Longest Common Prefix
 Leetcode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/887/
 
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

  

 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  
 */


func longestCommonPrefix(of strings:[String]) -> String {
    guard !strings.isEmpty else { return "" }
    guard strings.filter({$0.isEmpty }).isEmpty else { return "" }
    
    var commonPrefix = ""
    let template = strings.min(by: { $0.count < $1.count }) ?? ""
    
    for (i,letter) in template.enumerated() {
        
        var commonPrefixContinues = true
        for word in strings {
            let index = word.index(word.startIndex, offsetBy: i)
            let char = word[index]
            if char != letter {
                commonPrefixContinues = false
            }
        }
        
        if commonPrefixContinues {
            commonPrefix.append(letter)
        } else {
            return commonPrefix
        }
    }
    return commonPrefix
}
/*
 Time complexity: O(M*N^2). M is lenth of "strings" array. M is min length of any string in arrray.
 Since String.Index of Swift has O(N) complexity, our complexity is O(M*N^2). But we can reduce it to O(M*N)
 by using an array. In such a case, our time complexity drops but space complexity increases.
 
 Space complexity: O(1)
 */

var input = ["flower", "flow", "flight"]
longestCommonPrefix(of: input)


input = ["dog", "racecar", "car"]
longestCommonPrefix(of: input)
