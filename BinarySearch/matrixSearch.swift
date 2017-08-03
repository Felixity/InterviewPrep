//
//  main.swift
//  matrixSearch
//
//  Created by Laura on 8/2/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

/*
 
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 For example,
 
 Consider the following matrix:
 
 [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 Given target = 3, return true.
 
 */


class Solution {
    
    func searchLine(_ m: [Int],_ target: Int) -> Bool {
        
        if m.isEmpty {
            return false
        }
        
        var start = 0
        var end = m.count - 1
        var mid: Int
        
        while start <= end {
            mid = (start + end)/2
            
            if target == m[mid] {
                return true
            }
            
            if m[mid] < target {
                start = mid + 1
            }
            else {
                end = mid - 1
            }
        }
        
        return false
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        if matrix.isEmpty {
            return false
        }
        
        var startRow = 0
        var endRow = matrix.count - 1
        
        var midRow: Int
        
        if matrix[0].count == 0 {
            return false
        }
        
        let colSize = matrix[0].count - 1
        
        while startRow <= endRow {

            midRow = (startRow + endRow) / 2
            
            if matrix[midRow][0] <= target && target <= matrix[midRow][colSize] {
                
                // check if the element can be found on this row
                return searchLine(matrix[midRow], target)
            }
            
            if matrix[midRow][0] > target {
                endRow = midRow - 1
            }
            else if target > matrix[midRow][colSize] {
                // target > matrix[midRow][colSize]
                startRow = midRow + 1
            }
        }
        
        return false
    }
}

let matrix = [[]]
//    [
//        [1,   3,  5,  7],
//        [10, 11, 16, 20],
//        [23, 30, 34, 50]]

let sol = Solution()
print(sol.searchMatrix(matrix as! [[Int]], 15))
