//
//  _101TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//101. Symmetric Tree
//
//Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

import XCTest

extension Solution {
    //iteracii
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var queue: [(TreeNode?, TreeNode?)] = [(root?.left, root?.right)]

        while !queue.isEmpty {
            let (t1, t2) = queue.removeFirst()
            if t1 == nil && t2 == nil { continue }
            if t1 == nil || t2 == nil || t1!.val != t2!.val { return false }
            queue.append((t1!.left, t2!.right))
            queue.append((t1!.right, t2!.left))
        }

        return true
    }
    
    //recursion
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        func isMirror(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
//            if t1 == nil && t2 == nil { return true }
//            if t1 == nil || t2 == nil { return false }
//            return t1!.val == t2!.val &&
//            isMirror(t1!.left, t2!.right) &&
//            isMirror(t1!.right, t2!.left)
//        }
//        
//        return isMirror(root?.left, root?.right)
//    }
}

class _101TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let rightNode3 = TreeNode(3)
        let leftNode3 = TreeNode(4)
        let rightNode1 = TreeNode(2, leftNode3, rightNode3)

        let rightNode2 = TreeNode(4)
        let leftNode2 = TreeNode(3)
        let leftNode1 = TreeNode(2, leftNode2, rightNode2)
        let root = TreeNode(1, leftNode1, rightNode1)

        let result = sut.isSymmetric(root)

        XCTAssertEqual(result, true)
    }

    func test_example2() {
        let sut = Solution()

        let rightNode3 = TreeNode(3)
        let rightNode1 = TreeNode(2, nil, rightNode3)

        let rightNode2 = TreeNode(3)
        let leftNode1 = TreeNode(2, nil, rightNode2)
        let root = TreeNode(1, leftNode1, rightNode1)

        let result = sut.isSymmetric(root)

        XCTAssertEqual(result, false)
    }

    func test_example4() {
        let sut = Solution()

        let root = TreeNode(1, nil, nil)
        let result = sut.isSymmetric(root)

        XCTAssertEqual(result, true)
    }

    func test_example5() {
        let sut = Solution()

        let result = sut.isSymmetric(nil)

        XCTAssertEqual(result, true)
    }
}
