//
//  _876TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//876. Middle of the Linked List
//
//Given the head of a singly linked list, return the middle node of the linked list.
//
//If there are two middle nodes, return the second middle node.

import XCTest

extension Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }

//    func middleNode(_ head: ListNode?) -> ListNode? {
//        var count = 0
//        var current = head
//        var hash = [Int: ListNode]()
//        while current != nil {
//            count += 1
//            hash[count] = current
//            current = current?.next
//        }
//        let middle = Int(count / 2) + 1
//        return hash[middle]
//    }
}

class _876TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let list4 = ListNode(5)
        let list3 = ListNode(4, list4)
        let list2 = ListNode(3, list3)
        let list1 = ListNode(2, list2)
        let head = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1,2,3,4,5], "precondition")

        let result = sut.middleNode(head)

        XCTAssertEqual(result?.listNodeValues, [3,4,5])
    }

    func test_example2() {
        let sut = Solution()

        let list5 = ListNode(6)
        let list4 = ListNode(5, list5)
        let list3 = ListNode(4, list4)
        let list2 = ListNode(3, list3)
        let list1 = ListNode(2, list2)
        let head = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1,2,3,4,5,6], "precondition")

        let result = sut.middleNode(head)

        XCTAssertEqual(result?.listNodeValues, [4, 5, 6])
    }

    func test_example3() {
        let sut = Solution()

        let list1 = ListNode(2)
        let head = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1, 2], "precondition")

        let result = sut.middleNode(head)

        XCTAssertEqual(result?.listNodeValues, [2])
    }

    func test_example4() {
        let sut = Solution()

        let result = sut.middleNode(nil)

        XCTAssertEqual(result?.listNodeValues, nil)
    }

    func test_example5() {
        let sut = Solution()

        let head = ListNode(1)
        XCTAssertEqual(head.listNodeValues, [1], "precondition")

        let result = sut.middleNode(head)

        XCTAssertEqual(result?.listNodeValues, [1])
    }
}
