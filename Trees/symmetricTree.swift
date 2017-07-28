//
//  main.swift
//  symmetricTree
//
//  Created by Laura on 7/28/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
 1
 / \
 2   2
 / \ / \
 3  4 4  3
 But the following [1,2,2,null,3,null,3] is not:
 1
 / \
 2   2
 \   \
 3    3
 
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
    
    private func isMirror(_ nodeLeft: TreeNode?, _ nodeRight: TreeNode?) -> Bool {
        
        var result = true
        
        if nodeLeft == nil && nodeRight == nil {
            return true
        }
        
        if let left = nodeLeft, let right = nodeRight, left.val == right.val {
            result = result && isMirror(left.left, right.right)
            result = result && isMirror(left.right, right.left)
            
        }
        else {
            result = false
        }
        
        return result
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        return isMirror(root, root)
    }
}

let n1 = TreeNode(1)
let n2 = TreeNode(2)
let n3 = TreeNode(2)
let n4 = TreeNode(3)
let n5 = TreeNode(4)
let n6 = TreeNode(4)
let n7 = TreeNode(3)

n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
n3.left = n6
n3.right = n7

//let n1 = TreeNode(1)
//let n2 = TreeNode(2)
//let n3 = TreeNode(2)
//let n4 = TreeNode(3)
//let n7 = TreeNode(3)
//
//n1.left = n2
//n1.right = n3
//n2.right = n4
//n3.right = n7


let sol = Solution()
let n = sol.isSymmetric(n1)
print("\(n)")
