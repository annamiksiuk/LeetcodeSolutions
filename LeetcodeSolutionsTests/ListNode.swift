//
//  ListNode.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 19.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

class ListNode {
    var val: Int
    var next: ListNode?

    init() {
        self.val = 0
        self.next = nil
    }

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }

    var listNodeValues: [Int] {
        guard let values = next?.listNodeValues else { return [val] }

        return [val] + values 
    }
}
