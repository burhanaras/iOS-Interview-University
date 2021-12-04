/*
 EASY: Rotate Array
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/646/
 
 Given an array, rotate the array to the right by k steps, where k is non-negative.
 
 
 
 Example 1:
 
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output:       [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 
 
 Follow up:
 
 Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 */

// -------- The Best Solution -------------

func rotateArray_0(of array: inout [Int], times k : Int) {
    var index = 0
    var number = array[index]
    var counter = 0
    
    while counter <= array.count {
        let pointerIndex = (index + k) % array.count
        let temp = array[pointerIndex]
        array[pointerIndex] = number
        number = temp
        index = pointerIndex
        counter += 1
    }
}

/*
    Time Complexity: O(N) Linear Time
    Space Complecity: O(1) Constant Time
 */

var array = [1,2,3,4,5,6,7]
rotateArray_0(of: &array, times: 3)










// -------- Dynamic programming -------------

func rotateArray(of array: inout [Int], times k: Int){
    guard k > 0 && !array.isEmpty else { return }
    let times = k % array.count
    for _ in 1...times {
        let theLastItem = array.last!
        var j = array.count - 1
        while j > 0 {
            array[j] = array[j - 1]
            j -= 1
        }
        array[0] = theLastItem
    }
}

/*
    Time Complexity: O(N*K) Linear Time
    Space Complexity: O(1) Constant Space
 */

array = [1,2,3,4,5,6,7]
rotateArray(of: &array, times: 3)










// -----------  Swifty Way 0 -------------------

func rotateArray_SwiftyWay_0(of array: inout [Int], times k: Int) {
    guard k > 0 && !array.isEmpty else { return }
    let times = k % array.count
    array = Array(array[(array.count - times)...]) + Array(array[...times])
}

array = [1,2,3,4,5,6,7]
rotateArray_SwiftyWay_0(of: &array, times: 3)










// -----------  Swifty Way 1 -------------------

func rotateArray_SwiftyWay_1(of array: inout [Int], times k: Int){
    guard k > 0 && !array.isEmpty else { return }
    for _ in 1...k {
        array.insert(array.removeLast(), at: 0)
    }
}

/*
    Time Complexity: O(N*K) Linear Time
    Space Complexity: O(1) Constant Space
 */

array = [1,2,3,4,5,6,7]
rotateArray_SwiftyWay_1(of: &array, times: 3)



