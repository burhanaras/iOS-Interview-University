/*
EASY: MAx Depth Of Binary Tree
LeetCode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/94/trees/555/
 
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 */

// MARK: - Required TreeNode class
class TreeNode {
    let value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode? = nil, right: TreeNode? = nil){
        self.value = value
        self.left = left
        self.right = right
    }
    
    convenience init(array: [Int]){
        precondition(!array.isEmpty)
        self.init(value: array.first!)
        for value in array.dropFirst() {
            insert(value: value)
        }
    }
    
    func insert(value: Int){
        if value < self.value {
             if let left = left {
               left.insert(value: value)
             } else {
               left = TreeNode(value: value)
             }
           } else {
             if let right = right {
               right.insert(value: value)
             } else {
               right = TreeNode(value: value)
             }
           }
    }

}

// MARK: - Maximum depth of a Binary Tree
func depth(node: TreeNode?) -> Int {
    if node == nil {
        return 0
    }
    else {
        return 1 + max(depth(node: node?.right), depth(node: node?.left))
    }
}


let root = TreeNode(array: [3,9,20,15,7])
depth(node: root)
