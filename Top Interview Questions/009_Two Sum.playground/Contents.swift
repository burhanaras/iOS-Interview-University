/*
 EASY: Two Sum
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/546/
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

  

 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Output: Because nums[0] + nums[1] == 9, we return [0, 1].
 */

func twoSum(nums: [Int], target: Int) -> [Int] {
    var dictionary = [Int: Int]()
    for (index, number) in nums.enumerated() {
        let difference = target - number
        if let existingIndex = dictionary[difference] {
            return [existingIndex, index]
        }
        dictionary[number] = index
    }
    return []
}
/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(N) Linear space
 */

//Tests
assert([0,1] == twoSum(nums: [2,7,11,15], target: 9))
assert([1,2] == twoSum(nums: [3,2,4], target: 6))
assert([0,1] == twoSum(nums: [3,3], target: 6))

