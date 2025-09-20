//
//  _100TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//100. Same Tree
//
//Given the roots of two binary trees p and q, write a function to check if they are the same or not.
//
//Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

import XCTest

extension Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }

        return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

class _100TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let rightNode2 = TreeNode(3)
        let leftNode2 = TreeNode(2)
        let root2 = TreeNode(1, leftNode2, rightNode2)

        let rightNode1 = TreeNode(3)
        let leftNode1 = TreeNode(2)
        let root1 = TreeNode(1, leftNode1, rightNode1)

        let result = sut.isSameTree(root1, root2)

        XCTAssertEqual(result, true)
    }

    func test_example2() {
        let sut = Solution()

        let rightNode2 = TreeNode(2)
        let root2 = TreeNode(1, nil, rightNode2)

        let leftNode1 = TreeNode(2)
        let root1 = TreeNode(3, leftNode1, nil)

        let result = sut.isSameTree(root1, root2)

        XCTAssertEqual(result, false)
    }

    func test_example3() {
        let sut = Solution()

        let rightNode2 = TreeNode(2)
        let leftNode2 = TreeNode(3)
        let root2 = TreeNode(1, leftNode2, rightNode2)

        let rightNode1 = TreeNode(3)
        let leftNode1 = TreeNode(2)
        let root1 = TreeNode(3, leftNode1, rightNode1)

        let result = sut.isSameTree(root1, root2)

        XCTAssertEqual(result, false)
    }

    func test_example4() {
        let sut = Solution()

        let result = sut.isSameTree(nil, nil)

        XCTAssertEqual(result, true)
    }
}
