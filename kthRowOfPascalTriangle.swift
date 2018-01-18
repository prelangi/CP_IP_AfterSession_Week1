/*
Given an index k, return the kth row of the Pascal’s triangle.

Pascal’s triangle : To generate A[C] in row R, sum up A’[C] and A’[C-1] from previous row R - 1.

Example:

Input : k = 3

Return : [1,3,3,1]
 NOTE : k is 0 based. k = 0, corresponds to the row [1]. 
Note:Could you optimize your algorithm to use only O(k) extra space?
*/

import Foundation

class Solution {
	func getRow(_ A: inout Int) -> [Int] {
        var result = Array(repeating:0, count: A+1)
        var previous = 1
        var pre1 = 1
        
        result[0] = 1
        
        if A == 0 {
            return result
        }
        
        for row in 1...A {
            previous = 1
            for elem in 1..<row {
                pre1 = result[elem]
                result[elem] += previous
                previous = pre1
            }
            
            result[row] = 1
        }
        
        return result
	}
}
