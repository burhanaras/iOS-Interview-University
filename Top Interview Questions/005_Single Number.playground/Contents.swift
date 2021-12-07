/*
 EASY: Single Number
 Leetcode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/549/
 
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.

  

 Example 1:

 Input: nums = [2,2,1]
 Output: 1
 Example 2:

 Input: nums = [4,1,2,1,2]
 Output: 4

 Example 3:

 Input: nums = [1]
 Output: 1
 
 */


func singleNumber_ConstantSpace(of nums: [Int]) -> Int {
    var result = 0
    for number in nums {
        result ^= number
    }
    return result
}
/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(1) Constant space
 
 EXPLANATION:
 When you XOR a number with itself, result is ZERO.
 When you XOR a number with ZERO, result is number itself.
 So, If we XOR all the numbers, since every number (except one) appears twice, result will be ZERO.
 Final when ZERO is XOR'ed with the Single Number (which we are looking for), then result is Single Number itself.
 */


// Tests
assert(4 == singleNumber_ConstantSpace(of: [1,2,3,4,1,2,3]))
assert(1 == singleNumber_ConstantSpace(of: [1]))




func singleNumber_WithLinearSpace(of nums: [Int]) -> Int {
    var dictionary = [Int: Int]()
    for number in nums {
        dictionary[number] = dictionary[number, default: 0] + 1
    }
    return dictionary.filter{ $0.value == 1 }.first?.key ?? -1
}

/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(N) Linear space
 
 EXPLANATION:
 We put all the numbers into a dictionary. Key is number itself, value is frequency.
 All frequencies are 2 except one number. That is the number we look for.
 */


// Tests
assert(4 == singleNumber_WithLinearSpace(of: [1,2,3,4,1,2,3]))
assert(1 == singleNumber_WithLinearSpace(of: [1]))
