//
//  main.swift
//  fraction
//
//  Created by Laura on 7/26/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
 
 If the fractional part is repeating, enclose the repeating part in parentheses.
 
 Example :
 
 Given numerator = 1, denominator = 2, return "0.5"
 Given numerator = 2, denominator = 1, return "2"
 Given numerator = 2, denominator = 3, return "0.(6)"
 
 */

import Foundation

class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        
        var result = ""
        
        if numerator == 0 {
            return "0"
        }
        
        if denominator == 0 {
            return "invalid operation"
        }
        
        let sign = (numerator > 0 && denominator < 0) || (numerator < 0 && denominator > 0)
        var division = abs(numerator) / abs(denominator)
        var remain = abs(numerator) % abs(denominator)
        
        let signString = sign ? "-" : ""
        result.append(signString)
        result.append(String(division))
        
        if remain == 0 {
            return result
        }
        
        result.append(".")
        
        var dictionary = [Int : Int]()
        var count = result.characters.count
        
        while remain != 0 {
            
            dictionary[remain] = count
            count += 1
            
            division = remain * 10 / abs(denominator)
            remain = remain * 10 % abs(denominator)
            
            result.append(String(division))
            
            // if new remain exists already in the hash table => we have a repeating part
            if let remainIndex = dictionary[remain] {
                result.insert("(", at: result.index(result.startIndex, offsetBy: remainIndex))
                result.append(")")
                break
            }
        }
        return result
    }
}

var sol = Solution()
print(sol.fractionToDecimal(-2, 1))
