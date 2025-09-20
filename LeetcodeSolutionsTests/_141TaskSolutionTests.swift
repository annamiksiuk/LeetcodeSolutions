//
//  _141TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//141. Linked List Cycle
//
//Given head, the head of a linked list, determine if the linked list has a cycle in it.
//
//There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
//
//Return true if there is a cycle in the linked list. Otherwise, return false.

import XCTest

extension Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head

        while let f = fast?.next?.next, let s = slow?.next {
            slow = s
            fast = f
            if slow === fast {
                return true
            }
        }

        return false
    }

//    func hasCycle(_ head: ListNode?) -> Bool {
//        var visited = Set<ObjectIdentifier>()
//        var tail: ListNode? = head
//
//        while let node = tail {
//            let id = ObjectIdentifier(node)
//            if visited.contains(id) {
//                return true
//            }
//            visited.insert(id)
//            tail = node.next
//        }
//
//        return false
//    }

//    func hasCycle(_ head: ListNode?) -> Bool {
//        guard let head else { return false }
//
//        var nodes = [head]
//        var tail = head
//        while let next = tail.next {
//            if nodes.contains(where: { $0 === next }) {
//                return true
//            }
//            nodes.append(next)
//            tail = next
//        }
//        return false
//    }
}

class _141TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
                
        let list3 = ListNode(-4)
        let list2 = ListNode(0, list3)
        let list1 = ListNode(2, list2)
        let head = ListNode(3, list1)
        list3.next = list1

        let result = sut.hasCycle(head)

        XCTAssertEqual(result, true)
    }

    func test_example2() {
        let sut = Solution()
                
        let list1 = ListNode(2)
        let head = ListNode(1, list1)
        list1.next = head

        let result = sut.hasCycle(head)

        XCTAssertEqual(result, true)
    }

    func test_example3() {
        let sut = Solution()
                
        let head = ListNode(1)

        let result = sut.hasCycle(head)

        XCTAssertEqual(result, false)
    }

    func test_example4() {
        let sut = Solution()
                
        let list1 = ListNode(2)
        let head = ListNode(1, list1)

        let result = sut.hasCycle(head)

        XCTAssertEqual(result, false)
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
        list7.next = list1

        let result = sut.hasCycle(head)

        XCTAssertEqual(result, true)
    }
}
