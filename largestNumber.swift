/*
Largest NumberBookmark Suggest Edit
Given a list of non negative integers, arrange them such that they form the largest number.

For example:

Given [3, 30, 34, 5, 9], the largest formed number is 9534330.

Note: The result may be very large, so you need to return a string instead of an integer.
*/

import Foundation

class Solution {
	func largestNumber(_ A: [Int]) -> String {
        var sortedArray = A.sorted(by:greaterInt)
        var resultString = ""
        
        for i in 0..<sortedArray.count { 
            resultString += String(sortedArray[i])
        }
        
        //corner case where the input array is all zeros
        //In this case, instead of returning "0000" we return "0"
        var startIndex = resultString.startIndex
        if resultString[startIndex] == "0" {
            return "0"
        }
            
            
        return resultString
	}
	
	func greaterInt(_ a:Int,_ b: Int) -> Bool {
        var str1 = String(a)
        var str2 = String(b)
    
        var resultStr = str1+str2
        var reverseResultStr = str2+str1
    
        if reverseResultStr > resultStr {
            return false
        }
        else {
            return true
        }
    }
}
