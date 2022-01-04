/*
 EASY: The First Unique Character In A String
 LeetCode: https://leetcode.com/explore/featured/card/top-interview-questions-easy/127/strings/881/
 
 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

  

 Example 1:
 Input: s = "leetcode"
 Output: 0
 
 Example 2:
 Input: s = "loveleetcode"
 Output: 2
 
 Example 3:
 Input: s = "aabb"
 Output: -1
  
 */

func findTheFirstUniqueCharacter(of str: String) -> Int {
    var dictionary = [Character: Int]()
    for letter in str {
        dictionary[letter] = dictionary[letter, default: 0] + 1
    }
    for (index, letter) in str.enumerated() {
        let frequency = dictionary[letter, default: 0]
        if frequency == 1 {
            return index
        }
    }
    return -1
}
/*
 Time complexity: O(N) Linear time
 Space complexity: O(N) Linear space
 */

var input = "leetcode"
findTheFirstUniqueCharacter(of: input)

input = "loveleetcode"
findTheFirstUniqueCharacter(of: input)

input = "aabb"
findTheFirstUniqueCharacter(of: input)

input = ""
findTheFirstUniqueCharacter(of: input)
