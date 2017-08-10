//
//  main.swift
//  removeDuplicates
//
//  Created by Laura on 8/6/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

/*
 
 Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 For example,
 Given input array nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
 
 
 1, 1, 1, 1, 2, 2, 3
 
 
 
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        var i = 0
        var j: Int!
        var count = 1
        var duplicates = 0
        
        if (nums.count == 0) {
            return 0
        }
        /*
        i = 1
        while (i < nums.count && (i + duplicates < nums.count)) {
            if (nums[i-1] == nums[i]) {
                //find next unique
                
                j = i
                duplicates = duplicates + 1
                while (j < nums.count - 1) {
                    nums[j] = nums[j+1]
                    j = j + 1
                }
                
            }
            else {
                count = count + 1
                i = i + 1
            }
            
        }
        */
        
        i = 1
        
        while i < nums.count {
            if (nums[i] != nums[i-1]) {
                count = count + 1
            }
            else {
                break
            }
            i = i + 1
        }
        i = i - 1
        
        while i < nums.count {
            j = i + 1
            while (j < nums.count) && (nums[i] == nums[j]) { j = j + 1 }
            
            if ( j == nums.count) {
                break
            }
            
            if (j != i + 1) {
                nums[count] = nums[j]
                i = j - 1
                count = count + 1
            }
            else {
                if count < i {
                    nums[count] = nums[j]
                    count = count + 1
                }
            }
            i = i + 1
        }
        
        
        return count
    }
}

let sol = Solution()
//var a = [1,1,1,1,2,2,3,3,3]
var a = [1,2,2,3,4]
print("\(sol.removeDuplicates(&a))")
