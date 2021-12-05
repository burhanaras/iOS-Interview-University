/*
 EASY: Intersection of Two Arrays II
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/674/
 
 Given two integer arrays nums1 and nums2, return an array of their intersection.
 Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

  
 Example 1:

 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 Example 2:

 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Explanation: [9,4] is also accepted.
 
 */

func findIntersection(of nums0: [Int], and nums1: [Int]) -> [Int] {
    var dictionary = [Int: Int]()
    for number in nums0 {
        dictionary[number] = dictionary[number, default: 0] + 1
    }
    var intersection = [Int]()
    for number in nums1 {
        if let existingCount = dictionary[number] {
            intersection.append(number)
            dictionary[number] = existingCount == 1 ? nil : existingCount - 1
        }
    }
    return intersection
}
/*
    Time Complexity: O(N+M) Linear Time
    Space Complexity: O(N)
 
 EXPLANATION:
 We put all the numbers of num0 into a dictionary with their frequencies.
 Then we check numbers of nums1, if they exist in dictionary.
 If they exist, we decrement value of dictionary item, then put number into intersection array.
 */

findIntersection(of: [1,2,2,1], and: [2,2])
findIntersection(of: [4,9,5], and: [9,4,9,8,4])
findIntersection(of: [1,2], and: [3,4])


/*
 Follow up:

 * What if the given array is already sorted? How would you optimize your algorithm?
    --> We can solve this with O(1) constant space and O(N+M) time.
 
 * What if nums1's size is small compared to nums2's size? Which algorithm is better?
    --> Dictionary approach is time efficient. For sorted arrays, we can use Two Pointers approach which is more space efficient.
 
* What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
    --> That means we can't sorth the array2. So, Dictionary approach is far better.
 */


// What if the arrays are sorted?
func findIntersection_Of_SortedArrays(of nums0: [Int], and nums1: [Int]) -> [Int]{
    var i = 0
    var j = 0
    var intersection = [Int]()
    
    while i < nums0.count && j < nums1.count {
        let firstNumber = nums0[i]
        let secondNumber = nums1[j]
        
        if firstNumber < secondNumber {
            i += 1
        } else if secondNumber < firstNumber {
            j += 1
        } else {
            intersection.append(firstNumber)
            i += 1
            j += 1
        }
    }
    return intersection
}
/*
    Time Complexity: O(min(N,M)) Linear time
    Space Complexity: O(1) Constant space
 */

findIntersection_Of_SortedArrays(of: [1,1,2,2], and: [2,2])
findIntersection_Of_SortedArrays(of: [4,5,9], and: [4,4,8,9,9])
findIntersection_Of_SortedArrays(of: [1,2], and: [3,4])
