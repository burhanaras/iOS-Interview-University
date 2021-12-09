/*
EASY: Valid Sudoku
LeetCode: https://leetcode.com/explore/featured/card/top-interview-questions-easy/92/array/769/
 
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:

 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
  

 Example 1:


 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 
 */

func isValidSudoku(board: [[Character]]) -> Bool {
    var dictionary = [String: Int]()
    
    for row in 0..<9 {
        for colum in 0..<9 {
            let char = board[row][colum]
            if char == "." { continue }
            let rowStr = "\(char) found at row \(row)"
            let columnStr = "\(char) found at \(colum)"
            let blockStr = "\(char) found at nlock \(row/3),\(colum/3)"
            
            if dictionary[rowStr] != nil || dictionary[columnStr] != nil || dictionary[blockStr] != nil {
                return false
            }
            
            dictionary[rowStr] = 1
            dictionary[columnStr] = 1
            dictionary[blockStr] = 1
        }
    }
    return true
}

/*
    Time Complexity: O(N^2) Quadratic time
    Space Complexity: O(N^2) Quadratic space
    Explanation: Inspired by https://www.youtube.com/watch?v=Pl7mMcBm2b8
 */

let board: [[Character]] =
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]


assert(true == isValidSudoku(board: board))


let inValidBoard: [[Character]] =
[["5","3","3",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

assert(false == isValidSudoku(board: inValidBoard))
