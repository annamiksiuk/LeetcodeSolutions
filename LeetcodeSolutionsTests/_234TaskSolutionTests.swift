//
//  _234TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//234. Palindrome Linked List
//
//Given the head of a singly linked list, return true if it is a palindrome or false otherwise.
//

import XCTest

extension Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var values: [Int] = []
        var current = head

        while current != nil {
            values.append(current!.val)
            current = current?.next
        }

        return values == values.reversed()
    }

//    func isPalindrome(_ head: ListNode?) -> Bool {
//        var slow = head
//        var fast = head
//        
//        // 1. Найти середину
//        while fast?.next != nil && fast?.next?.next != nil {
//            slow = slow?.next
//            fast = fast?.next?.next
//        }
//        
//        // 2. Развернуть вторую половину
//        var prev: ListNode? = nil
//        var curr = slow?.next
//        while curr != nil {
//            let next = curr?.next
//            curr?.next = prev
//            prev = curr
//            curr = next
//        }
//        
//        // 3. Сравнить обе половины
//        var left = head
//        var right = prev
//        while right != nil {
//            if left?.val != right?.val {
//                return false
//            }
//            left = left?.next
//            right = right?.next
//        }
//        
//        return true
//    }
}

class _234TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let list3 = ListNode(1, nil)
        let list2 = ListNode(2, list3)
        let list1 = ListNode(2, list2)
        let head: ListNode = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1,2,2,1], "precondition")
        
        let result = sut.isPalindrome(head)
        
        XCTAssertEqual(result, true)
    }

    func test_example2() {
        let sut = Solution()
        
        let list1 = ListNode(2, nil)
        let head: ListNode = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1,2], "precondition")
        
        let result = sut.isPalindrome(head)
        
        XCTAssertEqual(result, false)
    }

    func test_example3() {
        let sut = Solution()
        
        let list4 = ListNode(1, nil)
        let list3 = ListNode(2, list4)
        let list2 = ListNode(3, list3)
        let list1 = ListNode(2, list2)
        let head: ListNode = ListNode(1, list1)
        XCTAssertEqual(head.listNodeValues, [1,2,3,2,1], "precondition")
        
        let result = sut.isPalindrome(head)
        
        XCTAssertEqual(result, true)
    }
}
