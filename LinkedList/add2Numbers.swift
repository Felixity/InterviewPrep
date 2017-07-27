//
//  main.swift
//  add2Numbers
//
//  Created by Laura on 7/23/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

// (2 -> 4 -> 3) + (5 -> 6 -> 4)

/**
 * Definition for singly-linked list.
 */
 
public class ListNode {

    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class LinkedList {

    var head: ListNode?
    var last: ListNode?
    
    func insert(val: Int) {
        
        let newNode = ListNode(val)
        
        if head == nil {
            head = newNode
            last = head
        }
        else {
            last?.next = newNode
            last = last?.next
        }
    }
}

class Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var head1 = l1
        var head2 = l2
        
        if head1 == nil && head2 == nil {
            return nil
        }

        let resultList = LinkedList()
        var carry = 0
        var value = 0
        
        while head1 != nil && head2 != nil {
            
            value = ((head1?.val)! + (head2?.val)! + carry) % 10
            carry = ((head1?.val)! + (head2?.val)! + carry) / 10
            
            resultList.insert(val: value)
            
            head1 = head1?.next
            head2 = head2?.next
        }
        
        while head1 != nil {
            value = ((head1?.val)! + carry) % 10
            carry = ((head1?.val)! + carry) / 10

            resultList.insert(val: value)
            
            head1 = head1?.next
        }
        
        
        while head2 != nil {
            value = ((head2?.val)! + carry) % 10
            carry = ((head2?.val)! + carry) / 10
            
            resultList.insert(val: value)
            
            head2 = head2?.next
        }
        
        if carry == 1 {
        
            resultList.insert(val: carry)
        }
        
        return resultList.head
    }
    
    func printList(n: ListNode?) {
        var l = n
        
        while l != nil {
            print("\((l?.val)!) ")
            l = l?.next
        }
        print("\n")
    }
}

var l1 = LinkedList()
l1.insert(val: 5)
//l1.insert(val: 4)
//l1.insert(val: 3)

var l2 = LinkedList()
l2.insert(val: 5)
//l2.insert(val: 6)
//l2.insert(val: 4)

var sol = Solution()
var l = sol.addTwoNumbers(l1.head, l2.head)
sol.printList(n: l)
