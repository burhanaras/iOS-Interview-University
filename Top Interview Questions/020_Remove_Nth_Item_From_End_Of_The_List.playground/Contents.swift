/*
 EASY: Remove Nth Item From End Of the List
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/603/
 
 Given the head of a linked list, remove the nth node from the end of the list and return its head.


 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 */

// MARK: - Required Node class and printList() function
class Node {
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


// MARK: - Delete node from end
func deleteNodeFromEnd(node: Node?, n: Int) -> Node? {
    guard node != nil else { return nil }
    if node?.next == nil && n > 0{
        return nil
    }
    var tail = node
    var nthPrevNode = node
    var counter = 1
    while tail?.next != nil {
        counter += 1
        tail = tail?.next
        
        if counter > n+1 {
            nthPrevNode = nthPrevNode?.next
        }
    }
    
    nthPrevNode?.next = nthPrevNode?.next?.next
    
    return node
}
/*
 Time complexity: O(N)
 Space complexity: O(1)
 */


// MARK: - test
var node4 = Node(data: 4)
var node3 = Node(data: 3, next: node4)
var node2 = Node(data: 2, next: node3)
var node1 = Node(data: 1, next: node2)
var node0 = Node(data: 0, next: node1)

printList(node: node0)
deleteNodeFromEnd(node: node0, n: 2)
printList(node: node0)



var nodeX = Node(data: 1)
printList(node: nodeX)
let deleted = deleteNodeFromEnd(node: nodeX, n: 1)
printList(node: deleted)
