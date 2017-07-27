//
//  main.swift
//  reorderList
//
//  Created by Laura on 7/25/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

/*
 
 Given a singly linked list L: L0?L1?…?Ln-1?Ln,
 reorder it to: L0?Ln?L1?Ln-1?L2?Ln-2?…
 
 You must do this in-place without altering the nodes' values.
 
 For example,
 Given {1,2,3,4}, reorder it to {1,4,2,3}.
 
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
    func reorderList(_ head: ListNode?) {


        var list = head
        var size = 0
        
        while list != nil {
            size += 1
            list = list?.next
        }
        
        var middleIndex = (size % 2 == 0) ? (size / 2) : (size / 2 + 1)
        
        var previous: ListNode?
        var nextNode: ListNode?
        
        list = head
        
        while middleIndex > 0 {
            previous = list
            list = list?.next
            middleIndex -= 1
        }
        
        previous?.next = nil
        
        // reverse the right list
        previous = nil
        while (list != nil) {
            nextNode = list?.next
            list?.next = previous
            previous = list
            list = nextNode
        }
        
        var last = previous
        
        // merge the 2 lists
        list = head
        while (last != nil)
        {
            nextNode = list?.next
            list?.next = last
            list = list?.next
            last = last?.next
            list?.next = nextNode
            
            list = nextNode
        }
    }
}

var sol = Solution()
var list = LinkedList()
list.insert(val: 1)
list.insert(val: 2)
list.insert(val: 3)
list.insert(val: 4)
list.insert(val: 5)
list.insert(val: 6)
//list.insert(val: 7)
sol.reorderList(list.head)

