/*
 EASY: Linked List Cycle
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/773/
 
 Given head, the head of a linked list, determine if the linked list has a cycle in it.
 
 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
 */

// MARK: - Required Node class
class Node{
    let data: Int
    var next: Node? = nil
    
    init(data: Int, next: Node? = nil){
        self.data = data
        self.next = next
    }
}

// MARK: - Detect cycle in linked list
func hasCycle(node: Node?) -> Bool {
    guard node != nil else { return false}
    
    var fast = node
    var slow = node
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        
        if fast?.data == slow?.data {
            return true
        }
    }
    return false
}
/*
 Time complexity: O(N)
 Space complexity: O(1)
 */


let node4 = Node(data: 4, next: nil)
let node3 = Node(data: 3, next: node4)
let node2 = Node(data: 2, next: node3)
let node1 = Node(data: 1, next: node2)
let node0 = Node(data: 0, next: node1)


hasCycle(node: node0)
