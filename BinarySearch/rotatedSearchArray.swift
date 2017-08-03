//
//  main.swift
//  rotatedSearchArray
//
//  Created by Laura on 8/2/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

/*
 
 Suppose a sorted array is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7  might become 4 5 6 7 0 1 2 ).
 
 You are given a target value to search. If found in the array, return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 
 Input : [4 5 6 7 0 1 2] and target = 4
 Output : 0
 
 */


class Solution {
    
    func isTargetFound(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int{
        
        var startIndex = start // 0
        var endIndex = end // nums.count - 1
        var midIndex: Int
        
        while startIndex <= endIndex {
            midIndex = (startIndex + endIndex) / 2
            
            if nums[midIndex] == target {
                return midIndex
            }
            
            if nums[midIndex] < target {
                startIndex = midIndex + 1
            }
            else {
                endIndex = midIndex - 1
            }
        }
        
        return -1
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        if nums.isEmpty {
            return -1
        }
        
        var pivotIndex = 0
        
        for (key, value) in nums.enumerated() {
            if key + 1 <= nums.count - 1 {
                if value > nums[key + 1] {
                    pivotIndex = key
                }
            }
        }
        
        let isTargetInLeftArray = isTargetFound(nums, target, 0, pivotIndex)
        let isTargetInRightArray = isTargetFound(nums, target, pivotIndex + 1, nums.count - 1)
        
        
        return isTargetInLeftArray != -1 ? isTargetInLeftArray : (isTargetInRightArray != -1 ? isTargetInRightArray : -1)
    }
}

let sol = Solution()
//let nums = [4, 5, 6, 7, 0, 1, 2]
//print(sol.search(nums, 2))
let nums = [3,5,1]
print(sol.search(nums, 1))
