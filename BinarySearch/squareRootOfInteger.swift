//
//  main.swift
//  squareRootOfInteger
//
//  Created by Laura on 7/28/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 mplement int sqrt(int x).
 
 Compute and return the square root of x.
 
 If x is not a perfect square, return floor(sqrt(x))
 
 Example :
 
 Input : 11
 Output : 3
 DO NOT USE SQRT FUNCTION FROM STANDARD LIBRARY
 
 NOTE: You only need to implement the given function. Do not read input, instead use the arguments to the function. Do not print the output, instead return values as specified. Still have a doubt? Checkout Sample Codes for more details.
 
 */

import Foundation

class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 || x == 1 {
            return x
        }
        
        var start = 1
        var end = x
        var mid: Int
        var result = 1
            
        while start <= end {
            mid = (start + end)/2
         
            if mid * mid == x {
                return mid
            }
            
            if mid * mid < x {
                start = mid + 1
                result = mid
            }
            else {
                end = mid - 1
            }
        }
        
        return result
    }
}

let sol = Solution()
print("\(sol.mySqrt(7))")
