/*
 EASY: Reverse Linked List
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/560/
 Given the head of a singly linked list, reverse the list, and return the reversed list.
 */

// MARK: - Required Node class and printList() function

class Node<T> {
    let data: T
    var next: Node<T>? = nil
    
    init(data: T, next: Node<T>? = nil){
        self.data = data
        self.next = next
    }
}

func printList<T>(node: Node<T>?) -> String {
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


// MARK: - Reverse linked list

func reverseList<T>(node: Node<T>?) -> Node<T>? {
    guard node != nil else { return nil}
    var previous: Node<T>? = nil
    var current = node
    var next = node?.next
    
    while current != nil {
        current?.next = previous
        previous = current
        current = next
        next = current?.next
    }
    
    return previous
}
/*
 Time complexity: O(N)
 Space complexity: O(1)
 */


func reverseList_Recursive<T>(node: Node<T>?) -> Node<T>? {
    if node == nil || node?.next == nil {
        return node
    }
    
    let reversed = reverseList_Recursive(node: node?.next)
    node?.next?.next = node
    node?.next = nil
    return reversed
}
/*
 Time complexity: O(N)
 Space complexity: O(1)
 */

// MARK: - Test

var node4 = Node(data: 4)
var node3 = Node(data: 3, next: node4)
var node2 = Node(data: 2, next: node3)
var node1 = Node(data: 1, next: node2)
var node0 = Node(data: 0, next: node1)

printList(node: node0)
let reversed = reverseList(node: node0)
printList(node: reversed)

printList(node: node4)
let reversedRecursive = reverseList_Recursive(node: node4)
printList(node: reversedRecursive)
