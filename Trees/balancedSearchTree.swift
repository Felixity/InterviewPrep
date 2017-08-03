//
//  main.swift
//  balancedSearchTree
//
//  Created by Laura on 8/1/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import Foundation

/*
 
 Given a binary tree, determine if it is height-balanced.
 
 Height-balanced binary tree : is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 Return 0 / 1 ( 0 for false, 1 for true ) for this problem
 
 Example :
 
 Input :
 1
 / \
 2   3
 
 Return : True or 1
 
 Input 2 :
 3
 /
 2
 /
 1
 
 Return : False or 0
 Because for the root node, left subtree has depth 2 and right subtree has depth 0.
 Difference = 2 > 1.
 
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
            return -1
        }
        let leftDepth = getDepth(for: root?.left)
        let rightDepth = getDepth(for: root?.right)
        
        return max(leftDepth, rightDepth) + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        
        if root == nil {
            return true
        }
        let leftDepth = getDepth(for: root?.left)
        let rightDepth = getDepth(for: root?.right)
        
        let result = abs(leftDepth - rightDepth) < 2 ? true : false
        return result && isBalanced(root?.left) && isBalanced(root?.right)
    }
}

let n1 = TreeNode(1)
let n2 = TreeNode(2)
let n3 = TreeNode(2)
n1.left = n2
n1.right = n3
//let n4 = TreeNode(3)
//n2.left = n4
//n2.right = nil
//let n5 = TreeNode(3)
//n3.left = nil
//n3.right = n5
//let n6 = TreeNode(4)
//n4.left = n6
//n4.right = nil
//let n7 = TreeNode(4)
//n5.left = nil
//n5.right = n7

let sol = Solution()
print(sol.isBalanced(n1))
