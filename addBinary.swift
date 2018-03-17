/*

Given two binary strings, return their sum (also a binary string).

Example:

a = "100"

b = "11"
Return a + b = “111”.

*/

import Foundation

class Solution {
	func addBinary(_ A: inout String, _ B: inout String) -> String {
		var num1Arr = [Character]()
        	var num2Arr = [Character]()
        	var result = ""
        
        	if(A.isEmpty) {
            		return B
        	}
        	if(B.isEmpty) {
            		return B
        	}
        
        	A.map { num1Arr.append($0)}
        	B.map { num2Arr.append($0)}
 
        	var i = num1Arr.count-1, j = num2Arr.count-1
        	var sum = 0, carry = 0
        
        	while(i>=0 || j>=0 || carry>0) {
            	   sum = carry
            	   if(i>=0) {
                     sum += Int(String(num1Arr[i]))!
                     i = i-1
                   }
            
            	   if(j>=0) {
               	     sum += Int(String(num2Arr[j]))!
                     j = j-1
            	   }
            
            	   carry = sum/2
                   sum = sum%2
                  result = String(sum) + result
            
                }
             return result
	}

}
