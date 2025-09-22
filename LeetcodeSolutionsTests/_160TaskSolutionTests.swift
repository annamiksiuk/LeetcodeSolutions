//
//  _160TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//160. Intersection of Two Linked Lists
//
//Given the heads of two singly linked-lists headA and headB,
//return the node at which the two lists intersect.
//If the two linked lists have no intersection at all, return null.
//
//For example, the following two linked lists begin to intersect at node c1:
//
//The test cases are generated such that there are no cycles anywhere in the entire linked structure.
//
//Note that the linked lists must retain their original structure after the function returns.

import XCTest

extension Solution {
    //двухпроходный указатель
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA
        var b = headB

        while a !== b {
            a = (a == nil) ? headB : a?.next
            b = (b == nil) ? headA : b?.next
        }

        return a
    }

    //выровнять списки, узнать разницу в длинах и блинный список сместить на это количество шагов
//    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//        func getLength(_ head: ListNode?) -> Int {
//            var length = 0
//            var current = head
//            while current != nil {
//                length += 1
//                current = current?.next
//            }
//            return length
//        }
//
//        let lenA = getLength(headA)
//        let lenB = getLength(headB)
//        var a = headA
//        var b = headB
//
//        if lenA > lenB {
//            for _ in 0..<(lenA - lenB) {
//                a = a?.next
//            }
//        } else {
//            for _ in 0..<(lenB - lenA) {
//                b = b?.next
//            }
//        }
//
//        while a !== b {
//            a = a?.next
//            b = b?.next
//        }
//
//        return a
//    }

//iteracii
//    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//        var hash = Set<ObjectIdentifier>()
//        var currentHead: ListNode? = headA
//        while let node = currentHead {
//            let id = ObjectIdentifier(node)
//            hash.insert(id)
//            currentHead = node.next
//        }
//        
//        currentHead = headB
//        while let node = currentHead {
//            if hash.contains(ObjectIdentifier(node)) {
//                return node
//            }
//            currentHead = node.next
//        }
//
//        return nil
//    }
}

class _160TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let list4 = ListNode(5, nil)
        let list3 = ListNode(4, list4)
        let list2 = ListNode(8, list3)
        let list1 = ListNode(1, list2)
        let headA: ListNode = ListNode(4, list1)
        XCTAssertEqual(headA.listNodeValues, [4,1,8,4,5], "precondition")
        
        let list6 = ListNode(1, list2)
        let list5 = ListNode(6, list6)
        let headB: ListNode = ListNode(5, list5)
        XCTAssertEqual(headB.listNodeValues, [5,6,1,8,4,5], "precondition")
        
        let result = sut.getIntersectionNode(headA, headB)
        
        XCTAssertEqual(result?.listNodeValues, [8,4,5])
    }

    func test_example2() {
        let sut = Solution()
        
        let list4 = ListNode(4, nil)
        let list3 = ListNode(2, list4)
        let list2 = ListNode(1, list3)
        let list1 = ListNode(9, list2)
        let headA: ListNode = ListNode(1, list1)
        XCTAssertEqual(headA.listNodeValues, [1,9,1,2,4], "precondition")
        
        let headB: ListNode = ListNode(3, list3)
        XCTAssertEqual(headB.listNodeValues, [3,2,4], "precondition")

        let result = sut.getIntersectionNode(headA, headB)
        
        XCTAssertEqual(result?.listNodeValues, [2,4])
    }

    func test_example3() {
        let sut = Solution()
        
        let list2 = ListNode(4, nil)
        let list1 = ListNode(6, list2)
        let headA: ListNode = ListNode(2, list1)
        XCTAssertEqual(headA.listNodeValues, [2,6,4], "precondition")
        
        let list3 = ListNode(5, nil)
        let headB: ListNode = ListNode(1, list3)
        XCTAssertEqual(headB.listNodeValues, [1,5], "precondition")

        let result = sut.getIntersectionNode(headA, headB)
        
        XCTAssertEqual(result?.listNodeValues, nil)
    }
}
