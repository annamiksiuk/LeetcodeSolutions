//
//  _94TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//94. Binary Tree Inorder Traversal
//
//Given the root of a binary tree, return the inorder traversal of its nodes' values.

import XCTest

extension Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        
        var result = [Int]()
        var stack: [TreeNode] = []
        var current: TreeNode? = root

        while current != nil || !stack.isEmpty {
            while let node = current {
                stack.append(node) 
                current = node.left
            }

            let node = stack.removeLast()
            result.append(node.val)
            current = node.right
        }

        return result
    }

    //recursive
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard let root else { return [] }
//        
//        var result = [Int]()
//        result += inorderTraversal(root.left)
//        result += [root.val]
//        result += inorderTraversal(root.right)
//
//        return result
//    }
}

class _94TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let leftNode3 = TreeNode(3)
        let rightNode1 = TreeNode(2, leftNode3, nil)
        let root = TreeNode(1, nil, rightNode1)

        let result = sut.inorderTraversal(root)

        XCTAssertEqual(result, [1, 3, 2])
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

        let result = sut.inorderTraversal(root)

        XCTAssertEqual(result, [4,2,6,5,7,1,3,9,8])
    }

    func test_example4() {
        let sut = Solution()

        let root = TreeNode(1, nil, nil)
        let result = sut.inorderTraversal(root)

        XCTAssertEqual(result, [1])
    }

    func test_example5() {
        let sut = Solution()

        let result = sut.inorderTraversal(nil)

        XCTAssertEqual(result, [])
    }
}
