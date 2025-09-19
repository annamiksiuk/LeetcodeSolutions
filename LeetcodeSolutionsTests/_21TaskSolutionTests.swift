//
//  _21TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//21. Merge Two Sorted Lists
//
//You are given the heads of two sorted linked lists list1 and list2.
//
//Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
//
//Return the head of the merged linked list

import XCTest

extension Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 else { return list2 }
        guard let list2 else { return list1 }

        if list1.val < list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }
    }

//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        guard let list1 else { return list2 }
//        guard let list2 else { return list1 }
//
//        var currentList1: ListNode? = list1
//        var currentList2: ListNode? = list2
//        let head = ListNode()
//        var tail = head
//        while let node1 = currentList1, let node2 = currentList2 {
//            if node1.val < node2.val {
//                tail.next = node1
//                currentList1 = node1.next
//            } else {
//                tail.next = node2
//                currentList2 = node2.next
//            }
//            tail = tail.next!
//        }
//
//        tail.next = currentList1 ?? currentList2
//        return head.next
//    }
}

class _21TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let list12 = ListNode(4)
        let list11 = ListNode(2, list12)
        let list1 = ListNode(1, list11)
        
        let list22 = ListNode(4)
        let list21 = ListNode(3, list22)
        let list2 = ListNode(1, list21)

        XCTAssertEqual(list1.listNodeValues, [1,2,4], "precondition")
        XCTAssertEqual(list2.listNodeValues, [1,3,4], "precondition")

        let result = sut.mergeTwoLists(list1, list2)

        XCTAssertEqual(result?.listNodeValues, [1,1,2,3,4,4])
    }

    func test_example2() {
        let sut = Solution()
        
        let list2 = ListNode()

        XCTAssertEqual(list2.listNodeValues, [0], "precondition")

        let result = sut.mergeTwoLists(nil, list2)

        XCTAssertEqual(result?.listNodeValues, [0])
    }

    func test_example3() {
        let sut = Solution()

        let result = sut.mergeTwoLists(nil, nil)

        XCTAssertEqual(result?.listNodeValues, nil)
    }
}
