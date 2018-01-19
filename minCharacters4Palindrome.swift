/*
You are given a string. The only operation allowed is to insert characters in the beginning of the string. How many minimum characters are needed to be inserted to make the string a palindrome string

Example:
Input: ABC
Output: 2
Input: AACECAAAA
Output: 2
*/

import Foundation

class Solution {
	func solve(_ A: inout String) -> Int {
	    var result = numAppends(&A)
        return result
        
	}
	
	//Start deleting elems from the end to check if string is palindrome
	func numAppends(_ A: inout String) -> Int {
        var strLen = A.count
        var result = 0
        if(strLen==1 || strLen==0) {
            return 0 
        }
	        
	   for i in stride(from:strLen-1, through:0,by:-1) {
	        result = strLen-1-i
	        if(isPalindrome(&A,0,i)) {
	            return result
	        }
	   }
	   
	   return result
	}
	
	func isPalindrome(_ A: inout String,_ start: Int, _ end: Int) -> Bool {
	    var inpStr = Array(A.characters)
	    var start1 = start, end1 = end
	    while start1 < end1 {
	        if inpStr[start1] != inpStr[end1] {
	            return false
	        }
	        start1+=1
	        end1-=1
	   }
	   return true
	}
}
