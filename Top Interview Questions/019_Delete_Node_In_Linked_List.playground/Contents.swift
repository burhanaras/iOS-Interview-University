/*
 EASY: Delete Node in a Linked List
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/553/
 
 Write a function to delete a node in a singly-linked list. You will not be given access to the head of the list, instead you will be given access to the node to be deleted directly.

 It is guaranteed that the node to be deleted is not a tail node in the list.
 
 Input: head = [4,5,1,9], node = 5
 Output: [4,1,9]
 Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.

 */

// MARK: - Required Node class and printList(Node) function
class Node{
    var data: Int
    var next: Node?
    
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


// MARK: - DeleteNode() function

func deleteNode(node: Node?) -> Node? {
    guard node != nil else { return nil }
    if let data = node?.next?.data{
        node?.data = data
        node?.next = node?.next?.next
    }
    return node
}

/*
 Time complexity: O(1)
 Space complexity: O(1)
 */


// MARK: - Tests
var node4 = Node(data: 4)
var node3 = Node(data: 3, next: node4)
var node2 = Node(data: 2, next: node3)
var node1 = Node(data: 1, next: node2)
var node0 = Node(data: 0, next: node1)


printList(node: node0)
deleteNode(node: node2)
printList(node: node0)
