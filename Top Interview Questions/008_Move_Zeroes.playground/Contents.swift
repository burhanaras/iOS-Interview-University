/*
 EASY: Move Zeroes
 Leetcode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/567/
 
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

  

 Example 1:

 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:

 Input: nums = [0]
 Output: [0]
 
 */


func moveZeroes(nums: inout [Int]){
    var zeroPointer = -1
    for index in 0..<nums.count {
        if nums[index] > 0 {
            if zeroPointer != -1 {
                nums[zeroPointer] = nums[index]
                zeroPointer += 1
                nums[index] = 0
            }
        } else {
            if zeroPointer == -1 {
                zeroPointer = index
            }
        }
    }
}

/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(1) Constant space
 */

// Test
var nums = [0,1,0,3,12]
moveZeroes(nums: &nums)
assert([1,3,12,0,0] == nums)

nums = [0]
moveZeroes(nums: &nums)
assert([0] == nums)

nums = []
moveZeroes(nums: &nums)
assert([] == nums)
