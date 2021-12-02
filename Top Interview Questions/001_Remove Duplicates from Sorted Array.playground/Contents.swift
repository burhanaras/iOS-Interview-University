/*
 EASY: Remove Duplicates from Sorted Array:
 https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/727/

 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.
 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

 
 Example 1:

 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).

 Example 2:

 Input: nums = [0,0,1,1,1,2,2,3,3,4]
 Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 */


func removeDuplicates(of nums: inout [Int]) -> Int {
    guard nums.count > 1 else{ return nums.count }
    
    var lastDistinctPointer = 1
    for index in 1..<nums.count {
        let current = nums[index]
        let previous = nums[index - 1]
        if current != previous{
            nums[lastDistinctPointer] =  current
            lastDistinctPointer += 1
        }
    }
    return lastDistinctPointer
}

/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(1) Constant space
 
 */


//MARK - Tests

func test_000() -> Bool{
    var nums = [0,0,1,1,1,2,2,3,3,4]
    let expected = [0,1,2,3,4]
    let k = removeDuplicates(of: &nums)
    assert(k == expected.count)
    assert(nums.prefix(k).elementsEqual(expected))
    return true
}

func test_001() -> Bool{
    var nums = [1,1,2]
    let expected = [1,2]
    let k = removeDuplicates(of: &nums)
    assert(k == expected.count)
    assert(nums.prefix(k).elementsEqual(expected))
    return true
}

test_000()
test_001()
