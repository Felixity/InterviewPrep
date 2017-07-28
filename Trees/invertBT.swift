//
//  main.swift
//  invertBT
//
//  Created by Laura on 7/28/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Invert a binary tree.
 
 4
 /   \
 2     7
 / \   / \
 1   3 6   9
 
 to
 
 4
 /   \
 7     2
 / \   / \
 9   6 3   1
 
 */

import Foundation

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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let left = root?.left
        let right = root?.right
        
        root?.right = invertTree(left)
        root?.left = invertTree(right)
        
        return root
    }
}

let n1 = TreeNode(4)
let n2 = TreeNode(2)
let n3 = TreeNode(7)
let n4 = TreeNode(1)
let n5 = TreeNode(3)
let n6 = TreeNode(6)
let n7 = TreeNode(9)

n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
n3.left = n6
n3.right = n7

let sol = Solution()
let n = sol.invertTree(n1)
