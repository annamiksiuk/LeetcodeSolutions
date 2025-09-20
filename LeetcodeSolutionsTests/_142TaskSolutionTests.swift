//
//  _142TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//142. Linked List Cycle II
//
//Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.
//
//There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed). It is -1 if there is no cycle. Note that pos is not passed as a parameter.
//
//Do not modify the linked list.

import XCTest

extension Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var hasCycle = false
        var slow = head
        var fast = head
        
        while let f = fast?.next?.next, let s = slow?.next {
            slow = s
            fast = f
            if slow === fast {
                hasCycle = true
                break
            }
        }
        
        if !hasCycle {
            return nil
        }
        
        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }

        return slow
    }
}

class _142TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
                
        let list3 = ListNode(-4)
        let list2 = ListNode(0, list3)
        let list1 = ListNode(2, list2)
        let head = ListNode(3, list1)
        list3.next = list1

        let result = sut.detectCycle(head)

        XCTAssertEqual(result === list1, true)
    }

    func test_example2() {
        let sut = Solution()
                
        let list1 = ListNode(2)
        let head = ListNode(1, list1)
        list1.next = head

        let result = sut.detectCycle(head)

        XCTAssertEqual(result === head, true)
    }

    func test_example3() {
        let sut = Solution()
                
        let head = ListNode(1)

        let result = sut.detectCycle(head)

        XCTAssertEqual(result, nil)
    }

    func test_example4() {
        let sut = Solution()
                
        let list1 = ListNode(2)
        let head = ListNode(1, list1)

        let result = sut.detectCycle(head)

        XCTAssertEqual(result, nil)
    }

    func test_example5() {
        let sut = Solution()
        
        let list7 = ListNode(11)
        let list6 = ListNode(10, list7)
        let list5 = ListNode(7, list6)
        let list4 = ListNode(5, list5)
        let list3 = ListNode(-4, list4)
        let list2 = ListNode(0, list3)
        let list1 = ListNode(2, list2)
        let head = ListNode(3, list1)
        list7.next = list2

        let result = sut.detectCycle(head)

        XCTAssertEqual(result === list2, true)
    }
}
