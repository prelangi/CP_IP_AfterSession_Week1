/*
Given a string S, find the longest palindromic substring in S.

Substring of string S:

S[i...j] where 0 <= i <= j < len(S)

Palindrome string:

A string which reads the same backwards. More formally, S is palindrome if reverse(S) = S.

Incase of conflict, return the substring which occurs first ( with the least starting index ).

Example :

Input : "aaaabaaa"
Output : "aaabaaa"
*/

// Corner cases : "a", "ac", "aa", "abbcccbbbcaaccbababcbcabca" (conflict)
// Using DP to solve this problem. 

import Foundation

class Solution {
	func longestPalindrome(_ A: inout String) -> String {
        var result = ""
        let strLen = A.count
        var s1 = Array(A.characters)
        var start  = 0
        var resultLen = 2, maxLen = 1
        var startIdx = A.startIndex
        var endIdx = A.startIndex
        var dp = Array(repeating: Array(repeating:false,count:A.count), count: A.count)
        
        if strLen==1 {
            return A
        }
    
        for i in 0..<strLen {
            dp[i][i] = true
        }
    
        //Update dp for substrings of length 2
        if(strLen>=2) {
            for i in 0..<strLen-1 {
                if s1[i] == s1[i+1] {
                    dp[i][i+1] = true
                    start = i
                    maxLen = 2
                }
            }
        }
    
        //For lengths greater than 3
        // substring[i...j] is palindrome if s1[i]==s[j] && s[i+1...j-1] is palindrome
        if(strLen>=3) {
            for len in 3...strLen {
                //startIndex
                for i in 0...(strLen-len) {
                    var j = i+len-1
                    if dp[i+1][j-1] && s1[i] == s1[j] {
                        dp[i][j] = true
                        
                        if(len == maxLen) { //if there is a conflict, choose the first one
                            start = min(start,i)
                        }
                        else {
                            start = i
                        }
                        maxLen = max(maxLen,len)
                    }
                    else {
                        dp[i][j] = false
                    }
                }
            }
        }
    
        startIdx = A.index(A.startIndex,offsetBy:start)
        endIdx = A.index(startIdx, offsetBy:maxLen-1)
        result = String(A[startIdx...endIdx])
        return result
	}
}

