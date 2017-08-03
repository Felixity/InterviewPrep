//
//  main.swift
//  maxDepth
//
//  Created by Laura on 8/2/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

/*
 
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 */

public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    func getDepth(for root: TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        let leftDepth = getDepth(for: root?.left)
        let rightDepth = getDepth(for: root?.right)
        
        return max(leftDepth, rightDepth) + 1
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {

        if root == nil {
            return 0
        }
        
        return getDepth(for:root)
    }
}

let n1 = TreeNode(1)
let n2 = TreeNode(2)
let n3 = TreeNode(2)
n1.left = n2
n1.right = n3
let n4 = TreeNode(3)
n2.left = n4
n2.right = nil
let n5 = TreeNode(3)
n3.left = nil
n3.right = n5
let n6 = TreeNode(4)
n4.left = n6
n4.right = nil
let n7 = TreeNode(4)
n5.left = nil
n5.right = n7

let sol = Solution()
print(sol.maxDepth(n1))
