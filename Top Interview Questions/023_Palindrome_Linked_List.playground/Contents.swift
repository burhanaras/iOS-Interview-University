
/*
 EASY: Palindrome Linked List
 LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/772/
 Given the head of a singly linked list, return true if it is a palindrome.
 Example:
 Input: head = [1,2,2,1]
 Output: true
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
    guard node != nil else { return "nil" }
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

// MARK: - Is Palindrome
func isPalindrome(node: Node?) -> Bool {
    guard node != nil else { return true }
    var array = [Int]()
    var current = node
    while current != nil {
        if let data = current?.data {
            array.append(data)
        }
        current = current?.next
    }
    
    var i = 0
    var j = array.count - 1
    while j > i {
        if array[i] != array[j] {
            return false
        }
        i+=1
        j-=1
    }
    
    return true
}
/*
 Time complexity: O(N)
 Space complexity: O(N)
 */


let node3 = Node(data: 2)
let node2 = Node(data: 1, next: node3)
let node1 = Node(data: 1, next: node2)
let node0 = Node(data: 2, next: node1)


isPalindrome(node: node0)
