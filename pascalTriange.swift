/*
Given numRows, generate the first numRows of Pascal’s triangle.

Pascal’s triangle : To generate A[C] in row R, sum up A’[C] and A’[C-1] from previous row R - 1.

Example:

Given numRows = 5,

Return

[
     [1],
     [1,1],
     [1,2,1],
     [1,3,3,1],
     [1,4,6,4,1]
]
*/
import Foundation

class Solution {
	func generate(_ A: inout Int) -> [[Int]] {
        var pascalTriangle = [[Int]]()
        
        for row in 0..<A {
            var currRow = [Int]()
            
            for elem in 0...row {
                var elemVal = 1
                if elem>0 && elem<row {
                    //Compute curr elem Val from previous row values
                    elemVal = pascalTriangle[row-1][elem-1] + pascalTriangle[row-1][elem]
                }
                currRow.append(elemVal)
            }
            pascalTriangle.append(currRow)
        }
        
        return pascalTriangle
	}
}
