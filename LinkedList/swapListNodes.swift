//
//  main.swift
//  swapListNodes
//
//  Created by Laura on 7/25/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Given a linked list, swap every two adjacent nodes and return its head.
 
 For example,
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 
 Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
 
 */

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        var list = head
        var aux: Int
        
        while list != nil && list?.next != nil {
            aux = (list?.val)!
            list?.val = (list?.next?.val)!
            list?.next?.val = aux
            list = list?.next?.next
        }
        
        return head
    }
    
    func printList(_ head: ListNode?) {
        
        var n = head
        
        while n != nil {
            print("\((n?.val)!)")
            n = n?.next
        }
    }
}

let n1 = ListNode(1)
let n2 = ListNode(2)
let n3 = ListNode(3)
let n4 = ListNode(4)

n1.next = n2
n2.next = n3
n3.next = n4

var sol = Solution()
var n = sol.swapPairs(n1)
sol.printList(n)

