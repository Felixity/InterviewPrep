//: Playground - noun: a place where people can play

import Cocoa

//Given a roman numeral, convert it to an integer.
//
//Input is guaranteed to be within the range from 1 to 3999.


class Solution {
    func romanToInt(_ s: String) -> Int {
     
        var array: [Int] = []
        
        for char in s.characters {
            switch (char) {
            case "M": array.append(1000)
            break // 1000
                
            case "D": array.append(500)
            break // 500
                
            case "C": array.append(100)
            break// 100
                
            case "L": array.append(50)
            break// 50
                
            case "X": array.append(10)
            break// 10
                
            case "V": array.append(5)
            break// 5
                
            case "I": array.append(1)
            break// 1
                
            default: break
            }
        }
        
        var romanToInt = 0
        
        for (index, elem) in array.enumerated() {
        
            if (index < array.count - 1 ) && elem < array[index + 1] {
                romanToInt = romanToInt - elem
            }
            else {
                romanToInt = romanToInt + elem
            }
        }
        
        return romanToInt
    }
    
    init() {}
}

var sol = Solution()
var a = sol.romanToInt("MMMCMXCIX")
print("\(a)")

// 3999 = MMM CM XC IX

// 3 * 1000 + (-100 + 1000) (-10 + 100) + (-1 + 10)

// 3297 = MMM CC XC VII
