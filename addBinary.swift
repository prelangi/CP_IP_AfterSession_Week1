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
        var sum = 0
        var carry = 0
        var a0 = A
        var b0 = B
        
        //Make given inputs aligned
        if a0.count < b0.count {
            var num1 = b0.count - a0.count
            while(num1 > 0) {
                a0.insert("0",at:a0.startIndex)
                num1 -= 1
            }
        }
        else if b0.count < a0.count {
            var num1 = a0.count - b0.count
            while(num1 > 0) {
                b0.insert("0",at:b0.startIndex)
                num1 -= 1
            }
        }
    
        var a1 = Array(a0.characters)
        var b1 = Array(b0.characters)
        var result = String()
        var cnt = 0
        var num1 = 0, num2 = 0
        let len = a1.count
    
    
        for i in stride(from: len-1, through:0, by: -1) {
            num1 = Int(String(a1[i]))!
            num2 = Int(String(b1[i]))!
            sum = (num1^num2)^carry
            carry = (num1&num2) | (num1^num2)&carry
            result += String(sum)
        }
    
        if(carry>0) {
            result += String(carry)
        }
        
        return String(result.reversed())
	}
}
