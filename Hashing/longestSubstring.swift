//
//  main.swift
//  longestSubstring
//
//  Created by Laura on 7/27/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

/* 
 
 Given a string,
 find the length of the longest substring without repeating characters.
 
 Example:
 
 The longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3.
 
 For "bbbbb" the longest substring is "b", with the length of 1.
 
 NOTE: You only need to implement the given function. Do not read input, instead use the arguments to the function. Do not print the output, instead return values as specified. Still have a doubt? Checkout Sample Codes for more details.
 
 */


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        let len = s.characters.count
        
        var dictionary = [String: Int]()
        var maxCounter = 0
        var counter = 0
        var index = 0
        
        while index < len {
            let stringIndex = s.index(s.startIndex, offsetBy: index)
            let char = "\(s[stringIndex])"
            
            if let prevIndex = dictionary[char] {
                counter = min(counter + 1, index - prevIndex)
                dictionary[char] = index
            }
            else {
                dictionary[char] = index
                counter += 1
            }
            
            index += 1
            maxCounter = max(maxCounter, counter)
        }

        return maxCounter
    }
}

let sol = Solution()
print(sol.lengthOfLongestSubstring("dvdf"))
