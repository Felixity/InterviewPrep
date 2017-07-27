//
//  main.swift
//  partitionList
//
//  Created by Laura on 7/25/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 For example,
 Given 1->4->3->2->5->2 and x = 3,
 return 1->2->2->4->3->5.
 
 */


import Foundation

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
        let node = ListNode(val)
        if head == nil {
            head = node
            last = head
        }
        else {
            last?.next = node
            last = last?.next
        }
    }
}

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var smallerThanX: LinkedList?
        var equalToX: LinkedList?
        var greaterThanX: LinkedList?
        
        var list = head
        
        // loop through the list and add the current element to it's corresponding list
        while list != nil {
            
            if (list?.val)! < x {
                if smallerThanX == nil {
                    smallerThanX = LinkedList()
                }
                smallerThanX?.insert(val: (list?.val)!)
            }
            else if (list?.val)! == x {
                if equalToX == nil {
                    equalToX = LinkedList()
                }
                equalToX?.insert(val: (list?.val)!)
            }
            else {
                if greaterThanX == nil {
                    greaterThanX = LinkedList()
                }
                greaterThanX?.insert(val: (list?.val)!)
            }
            
            list = list?.next
        }
        
        // concat the 3 lists
        let partialList = concatTwoLists(head1: smallerThanX, head2: equalToX)
        let finalList = concatTwoLists(head1: partialList, head2: greaterThanX)
        
       return finalList?.head
    }
    
    private func concatTwoLists(head1: LinkedList?, head2: LinkedList?) -> LinkedList? {
        guard let head1 = head1 else {
            return head2
        }
        
        guard let head2 = head2 else {
            return head1
        }
        
        head1.last?.next = head2.head
        head1.last = head1.last?.next
        
        return head1
    }
    
    func printList(list: ListNode?) {
        
        var l = list
        
        while l != nil {

            print("\((l?.val)!)")
            l = l?.next
        }
    }
}

var list = LinkedList()
list.insert(val: 1)
list.insert(val: 4)
list.insert(val: 6)
list.insert(val: 2)
list.insert(val: 5)
list.insert(val: 2)

var sol = Solution()
sol.printList(list: list.head)
print("\n")
var res = sol.partition(list.head, 3)
sol.printList(list: res)
