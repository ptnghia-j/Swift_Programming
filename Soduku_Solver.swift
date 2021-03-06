/*
This is a Soduku Solver Program written in Swift programming language
Assuming this is a 9x9 table
*/

func solveSudoku(_ board: inout [[Character]]) -> Bool{
    let size = board.count

    func canPutNum(_ num: Character, row: Int, col: Int) -> Bool {
        let boxSize = 3
        for offset in 0..<size {
            if board[row][offset] == num || board[offset][col] == num {
                return false
            }
            let boxRow = row / boxSize * boxSize + offset / boxSize
            let boxCol = col / boxSize * boxSize + offset % boxSize
            if board[boxRow][boxCol] == num {
                return false
            }            
        }
        return true
    }

    func solve() -> Bool {
        for row in 0..<size {
            for col in 0..<size {
                guard board[row][col] == "." else { continue }
                for num in "123456789" {
                    guard canPutNum(num, row: row, col: col) else { continue }
                    board[row][col] = num
                    if solve() {
                        return true
                    }
                    board[row][col] = "."
                }
                return false
            }
        }
        return true
    }

    return solve()
}

var board: [[Character]] = [["8",".",".",".",".","9","4",".","."],
                            ["3",".",".",".","1",".","5","7","."],
                            [".",".",".",".","4",".",".",".","6"],
                            [".","6","3",".",".",".",".",".","."],
                            ["1","5",".","8",".","3",".","6","4"],
                            [".",".",".",".",".",".","3","9","."],
                            ["6",".",".",".","2",".",".",".","."],
                            [".","2","9",".","8",".",".",".","3"],
                            [".",".","8","4",".",".",".",".","2"]]

if solveSudoku(&board) {
    for row in 0..<9 {
        for col in 0..<9 {
            print("\(board[row][col])", terminator: " ")
        }
        print("\n")
    }
} else {
    print("Not possible to solve")
}



