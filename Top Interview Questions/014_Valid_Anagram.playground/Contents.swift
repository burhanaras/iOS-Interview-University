/*
 EASY: Valid Anagram
 LeetCode: https://leetcode.com/explore/featured/card/top-interview-questions-easy/127/strings/882/
 
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

  

 Example 1:

 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:

 Input: s = "rat", t = "car"
 Output: false

 
 */


func isAnagram(s: String, t: String) -> Bool {
    guard t.count == s.count else { return false }
    guard !s.isEmpty else { return false }
    var dictionary = [Character: Int]()
    for letter in s {
        dictionary[letter] = dictionary[letter, default: 0] + 1
    }
    for letter in t {
        if let existingCount = dictionary[letter] {
            if existingCount == 1 {
                dictionary[letter] = nil
            } else {
                dictionary[letter] = existingCount - 1
            }
        } else {
            return false
        }
    }
    return dictionary.isEmpty
}
/*
 Time Complexity: O(N) Linear time
 Space Complexity: O(N) Linear space
 */

var s = "anagram"
var t = "nagaram"
isAnagram(s: s, t: t)


s = "rat"
t = "cat"
isAnagram(s: s, t: t)

s = ""
t = ""
isAnagram(s: s, t: t)



// MARK: - Swifty solution

func isAnagram_SwiftyWay(s: String, t: String) -> Bool {
    guard s.count == t.count else { return false }
    guard !s.isEmpty else { return false }
    
    let sorted0 = Array(s).sorted()
    let sorted1 = Array(t).sorted()
    return sorted0 == sorted1
}
/*
 Time Complexity: O(N Log N) since sorted() takes this time
 Space Complexity: O(N)
 */

s = "anagram"
t = "nagaram"
isAnagram_SwiftyWay(s: s, t: t)


s = "rat"
t = "cat"
isAnagram_SwiftyWay(s: s, t: t)

s = ""
t = ""
isAnagram_SwiftyWay(s: s, t: t)
