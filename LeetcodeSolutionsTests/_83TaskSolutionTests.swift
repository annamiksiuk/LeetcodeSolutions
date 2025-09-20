//
//  _83TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//83. Remove Duplicates from Sorted List
//
//Given the head of a sorted linked list, delete all duplicates such that each element appears only once.
//Return the linked list sorted as well.

import XCTest

extension Solution {
//    перемещает указатель после того, как найден следующий отличающийся элемент
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        var current = head
//        var tail = head
//        while current != nil {
//            let next = current?.next
//            if next?.val != current?.val {
//                tail?.next = next
//                tail = next
//            }
//            current = next
//        }
//        return head
//    }

    //перемещает указатель сразу, если найден дубликат
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head

        while let node = current {
            while node.next != nil && node.val == node.next!.val {
                node.next = node.next!.next
            }
            current = node.next
        }

        return head
    }
}

class _83TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let list2 = ListNode(2)
        let list1 = ListNode(1, list2)
        let head = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1, 1, 2], "precondition")

        let result = sut.deleteDuplicates(head)

        XCTAssertEqual(result?.listNodeValues, [1, 2])
    }

    func test_example2() {
        let sut = Solution()

        let list4 = ListNode(3)
        let list3 = ListNode(3, list4)
        let list2 = ListNode(2, list3)
        let list1 = ListNode(1, list2)
        let head = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1, 1, 2, 3, 3], "precondition")

        let result = sut.deleteDuplicates(head)

        XCTAssertEqual(result?.listNodeValues, [1, 2, 3])
    }

    func test_example3() {
        let sut = Solution()

        let list4 = ListNode(2)
        let list3 = ListNode(1, list4)
        let list2 = ListNode(1, list3)
        let list1 = ListNode(1, list2)
        let head = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1, 1, 1, 1, 2], "precondition")

        let result = sut.deleteDuplicates(head)

        XCTAssertEqual(result?.listNodeValues, [1, 2])
    }

    func test_example4() {
        let sut = Solution()

        let list4 = ListNode(2)
        let list3 = ListNode(2, list4)
        let list2 = ListNode(1, list3)
        let list1 = ListNode(1, list2)
        let head = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1, 1, 1, 2, 2], "precondition")

        let result = sut.deleteDuplicates(head)

        XCTAssertEqual(result?.listNodeValues, [1, 2])
    }
}
