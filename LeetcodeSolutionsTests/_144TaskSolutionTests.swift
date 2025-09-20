//
//  _144TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//144. Binary Tree Preorder Traversal
//
//Given the root of a binary tree, return the preorder traversal of its nodes' values.

import XCTest

extension Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }

        var values = [Int]()
        var stack: [TreeNode] = [root]

        while !stack.isEmpty {
            let t = stack.removeLast()
            values.append(t.val)
            if let right = t.right {
                stack.append(right)
            }
            if let left = t.left {
                stack.append(left)
            }
        }

        return values
    }

//    recursive
//    func preorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard let root else { return [] }
//
//        var values = [root.val]
//        values += preorderTraversal(root.left)
//        values += preorderTraversal(root.right)
//
//        return values
//    }
}

class _144TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let leftNode3 = TreeNode(3)
        let rightNode1 = TreeNode(2, leftNode3, nil)
        let root = TreeNode(1, nil, rightNode1)

        let result = sut.preorderTraversal(root)

        XCTAssertEqual(result, [1, 2, 3])
    }

    func test_example2() {
        let sut = Solution()
        
        let leftNode4 = TreeNode(9, nil, nil)
        let rightNode4 = TreeNode(8, leftNode4, nil)
        let rightNode1 = TreeNode(3, nil, rightNode4)

        let rightNode3 = TreeNode(7, nil, nil)
        let leftNode3 = TreeNode(6, nil, nil)
        let rightNode2 = TreeNode(5, leftNode3, rightNode3)
        let leftNode2 = TreeNode(4, nil, nil)
        let leftNode1 = TreeNode(2, leftNode2, rightNode2)
        let root = TreeNode(1, leftNode1, rightNode1)

        let result = sut.preorderTraversal(root)

        XCTAssertEqual(result, [1,2,4,5,6,7,3,8,9])
    }

    func test_example4() {
        let sut = Solution()

        let root = TreeNode(1, nil, nil)
        let result = sut.preorderTraversal(root)

        XCTAssertEqual(result, [1])
    }

    func test_example5() {
        let sut = Solution()

        let result = sut.preorderTraversal(nil)

        XCTAssertEqual(result, [])
    }
}
