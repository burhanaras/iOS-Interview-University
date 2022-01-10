/*
 EASY: Merge Two Sorted List
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/771/
 
 You are given the heads of two sorted linked lists list1 and list2.
 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.
 Return the head of the merged linked list.
 
 Example:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 */

// MARK: - Required Node class and printList() function
class Node{
    let data: Int
    var next: Node? = nil
    
    init(data: Int, next: Node? = nil){
        self.data = data
        self.next = next
    }
}

func printList(node: Node?) -> String {
    guard node != nil else { return "" }
    var result = ""
    var current = node
    while current != nil {
        if let data = current?.data {
            result.append("\(data) -> ")
        }
        current = current?.next
    }
    result.append("nil")
    return result
}


// MARK: - Merge Two Sorted List
func merge(node0: Node?, node1: Node?) -> Node? {
    guard node0 != nil else { return node1 }
    guard node1 != nil else { return node0 }
    
    let head = Node(data: 0, next: nil)
    var current: Node? = head
    
    var head0 = node0
    var head1 = node1
    
    while head0 != nil && head1 != nil {
        if let data0 = head0?.data, let data1 = head1?.data {
            if data0 < data1 {
                current?.next = head0
                current = head0
                head0 = head0?.next
            } else {
                current?.next = head1
                current = head1
                head1 = head1?.next
            }
        }
    }
    
    if head0 != nil {
        current?.next = head0
    }
    
    if head1 != nil {
        current?.next = head1
    }
    
    return head.next
}
/*
 Time complexity: O(M+N)
 Space complexity: O(1)
 */



let node4 = Node(data: 4)
let node3 = Node(data: 4, next: node4)
let node2 = Node(data: 2, next: node3)
let node1 = Node(data: 1, next: node2)
let node0 = Node(data: 1, next: node1)
printList(node: node0)



let node8 = Node(data: 5)
let node7 = Node(data: 4, next: node8)
let node6 = Node(data: 3, next: node7)
let node5 = Node(data: 1, next: node6)
printList(node: node5)


let merged = merge(node0: node0, node1: node5)
printList(node: merged)
