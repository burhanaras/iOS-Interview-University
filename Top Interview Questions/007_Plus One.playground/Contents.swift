/*
 EASY: Plus One
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/559/
 
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

 Increment the large integer by one and return the resulting array of digits.

  

 Example 1:

 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 
 Example 2:

 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
 
 */

import Darwin

func plusOne(digits: inout [Int]) -> [Int] {
    guard digits.count > 0 else { return [] }
    var index = digits.count - 1
    var carry = true
    while carry && index >= 0 {
        if digits[index] == 9 {
            digits[index] = 0
            index -= 1
        } else {
            digits[index] += 1
            carry = false
        }
    }
    
    if carry { digits.insert(1, at: 0)}
    return digits
}

/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(1) Constant space
 */


// Tests
var digits = [1,2,3,4]
plusOne(digits: &digits)
assert(digits == [1,2,3,5])

digits = [1,2,3,9]
plusOne(digits: &digits)
assert(digits == [1,2,4,0])

digits = [9,9]
plusOne(digits: &digits)
assert(digits == [1,0,0])

digits = [9]
plusOne(digits: &digits)
assert(digits == [1,0])

digits = [0]
plusOne(digits: &digits)
assert(digits == [1])

digits = []
plusOne(digits: &digits)
assert(digits == [])




//The Second Solution
func plusOne_SecondSolution(digits: inout [Int]) -> [Int]{
    guard digits.count > 0 else { return [] }
    var sum = 0
    for (index, number) in digits.enumerated() {
        sum += number * Int(pow(10.0, Double(digits.count - 1 - index)))
    }
    sum = sum + 1
    
    var pointer = digits.count - 1
    while sum > 0 && pointer >= 0 {
        let digit = sum % 10
        sum = sum / 10
        digits[pointer] = digit
        pointer -= 1
    }
    if sum > 0 { digits.insert(sum, at: 0)}
    return digits
}

/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(1) Constant time
    Explanation:
    We turn array into an Int.
    Increment by one.
    Then turn number into an array.
 */


// Tests
var digitz = [1,2,3,4]
plusOne_SecondSolution(digits: &digitz)
assert(digitz == [1,2,3,5])

digitz = [1,2,3,9]
plusOne_SecondSolution(digits: &digitz)
assert(digitz == [1,2,4,0])

digitz = [9,9]
plusOne_SecondSolution(digits: &digitz)
assert(digitz == [1,0,0])

digitz = [9]
plusOne_SecondSolution(digits: &digitz)
assert(digitz == [1,0])

digitz = [0]
plusOne_SecondSolution(digits: &digitz)
assert(digitz == [1])

digitz = []
plusOne_SecondSolution(digits: &digitz)
assert(digitz == [])
