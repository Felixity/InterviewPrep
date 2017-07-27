//
//  main.swift
//  twoSum
//
//  Created by Laura on 7/26/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

/*
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 */

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class LinkedList {
    var head: ListNode?
    var last: ListNode?
    
    func insert(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            last = head
        }
        else {
            last?.next = ListNode(val)
            last = last?.next
        }
    }
}

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var hashMap = [Int : LinkedList]()
        var result: [Int] = []
        
        var i = 0
        for num in nums {
            if let foundedList = hashMap[num] {
                foundedList.insert(i)
            }
            else {
                let list = LinkedList()
                list.insert(i)
                hashMap[num] = list
                
            }
            i += 1
        }
        
        for (index, num) in nums.enumerated() {
            let diff = target - num
            if let foundedList = hashMap[diff] {
                
                var p = foundedList.head
                if p?.val == index {
                    if p?.next != nil {
                        p = p?.next
                        result.append(index)
                        result.append((p?.val)!)
                        break
                    }
                }
                else {
                    result.append(index)
                    result.append((p?.val)!)
                    break
                }
            }
        }
        
        return result
    }
}


var array = [2, 7, 11, 15]
var target = 9

var sol = Solution()
var result = sol.twoSum(array, target)

for index in result {
    print("\(index)")
}
