/*
 EASY: Contains Duplicate
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/578/
 
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

  
 Example 1:

 Input: nums = [1,2,3,1]
 Output: true
 Example 2:

 Input: nums = [1,2,3,4]
 Output: false

 
 */

func containsDuplicate(nums: [Int]) -> Bool {
    var dictionary = [Int: Int]()
    for number in nums {
        if let _ = dictionary[number] {
            return true
        }
        dictionary[number] = 1
    }
    return false
}

/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(1) Linear space
 */

//Tests
assert(containsDuplicate(nums: [1,2,3,1]) == true)
assert(containsDuplicate(nums: [1,2,3,4]) == false)
assert(containsDuplicate(nums: []) == false)
