//
//  _206TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//206. Reverse Linked List
//
//Given the head of a singly linked list, reverse the list, and return the reversed list.

import XCTest

extension Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head, let next = head.next else {
            return head
        }

        let reversedHead = reverseList(next)
        next.next = head
        head.next = nil
        return reversedHead
    }
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        guard let head else { return nil }
//        
//        var previous: ListNode? = nil
//        var current: ListNode? = head
//        while current != nil {
//            let next = current?.next
//            current?.next = previous
//            previous = current
//            current = next
//        }
//        return previous
//    }
}

class _206TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let list4 = ListNode(5, nil)
        let list3 = ListNode(4, list4)
        let list2 = ListNode(3, list3)
        let list1 = ListNode(2, list2)
        let head: ListNode = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1,2,3,4,5], "precondition")
        let result = sut.reverseList(head)

        XCTAssertEqual(result?.listNodeValues, [5,4,3,2,1])
    }

    func test_example2() {
        let sut = Solution()
        
        let list1 = ListNode(2, nil)
        let head: ListNode = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1,2], "precondition")
        let result = sut.reverseList(head)

        XCTAssertEqual(result?.listNodeValues, [2,1])
    }

    func test_example3() {
        let sut = Solution()
        
        let head: ListNode? = nil
        let result = sut.reverseList(head)

        XCTAssertEqual(result?.listNodeValues, nil)
    }
}
