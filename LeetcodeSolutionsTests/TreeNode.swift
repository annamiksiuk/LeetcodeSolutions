//
//  TreeNode.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 20.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }

    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

    var treeNodeValues: [Int?] {
        var values: [Int?] = [val]
        if let leftValues = left?.treeNodeValues {
            values += leftValues
        } else {
            values += [nil]
        }
        if let rightValues = right?.treeNodeValues {
            values += rightValues
        } else {
            values += [nil]
        }

        return values
    }
}

