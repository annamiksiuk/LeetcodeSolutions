//
//  _104TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//104. Maximum Depth of Binary Tree
//
//Given the root of a binary tree, return its maximum depth.
//
//A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

import XCTest

extension Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        if root.left == nil && root.right == nil {
            return 1
        }

        let leftCount = maxDepth(root.left)
        let rightCount = maxDepth(root.right)

        return max(leftCount, rightCount) + 1
    }
}

class _104TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let rightNode2 = TreeNode(7)
        let leftNode2 = TreeNode(15)
        let rightNode1 = TreeNode(20, leftNode2, rightNode2)
        let leftNode1 = TreeNode(9)
        let root = TreeNode(3, leftNode1, rightNode1)

        let result = sut.maxDepth(root)

        XCTAssertEqual(result, 3)
    }

    func test_example2() {
        let sut = Solution()

        let rightNode1 = TreeNode(2)
        let root = TreeNode(1, nil, rightNode1)

        let result = sut.maxDepth(root)

        XCTAssertEqual(result, 2)
    }

    func test_example3() {
        let sut = Solution()

        let result = sut.maxDepth(nil)

        XCTAssertEqual(result, 0)
    }
}
