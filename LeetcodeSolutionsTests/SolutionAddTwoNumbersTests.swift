//
//  SolutionAddTwoNumbersTests.swift
//  LeetcodeSolutionsTests
//
//  Created by Anna Miksiuk on 3/1/20.
//  Copyright © 2020 Anna Miksiuk. All rights reserved.
//

import XCTest

//https://leetcode.com/problems/add-two-numbers/
//2. Add Two Numbers
//
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example:
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.

extension ListNode {
    func explanation() -> String {
        if next == nil {
            return "\(self.val)"
        }
        var result = "\(self.val)"
        var nextList = self.next
        while nextList != nil {
            result += " -> \(nextList?.val ?? 0)"
            nextList = nextList?.next
        }
        
        return result
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}

extension Solution {
    func len(list: ListNode) -> Int {
        var len = 1
        var next = list.next
        while next != nil {
            len += 1
            next = next?.next
        }
        return len
    }

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 != nil && l2 == nil {
            return l1
        }
        
        if l2 != nil && l1 == nil {
            return l2
        }
        
        guard let list1 = l1, let list2 = l2 else {
            return nil
        }

        let lenList1 = len(list: list1)
        let lenList2 = len(list: list2)
        
        var result: ListNode?
        var longList: ListNode?
        var shortList: ListNode?
        if lenList1 >= lenList2 {
            result = list1
            longList = list1
            shortList = list2
        } else {
            result = list2
            longList = list2
            shortList = list1
        }
        
        var lastElement: ListNode?
        var overflowCounter = 0
        while longList != nil {
            
            var sum = (longList?.val ?? 0) + (shortList?.val ?? 0) + overflowCounter
            overflowCounter = 0
            
            while sum > 9 {
                overflowCounter += 1
                sum -= 10
            }
            
            longList?.val = sum
            lastElement = longList
            longList = longList?.next
            shortList = shortList?.next
        }
        
        if overflowCounter > 0 {
            let tail = ListNode(overflowCounter)
            lastElement?.next = tail
        }
        
        return result
    }
}

class SolutionAddTwoNumbersTests: XCTestCase {
    func test_resultNil_forAddTwoNillList() {
        let sut = Solution()
        
        let result = sut.addTwoNumbers(nil, nil)
        
        XCTAssertNil(result)
    }

    func test_returnAugend_forNilAddend() {
        let sut = Solution()
        let augend = ListNode(1)
        
        let result = sut.addTwoNumbers(augend, nil)
        
        XCTAssertEqual(augend, result)
    }

    func test_returnAddend_forNilAugend() {
        let sut = Solution()
        let addend = ListNode(1)
        
        let result = sut.addTwoNumbers(nil, addend)
        
        XCTAssertEqual(addend, result)
    }

    func test_returnSum_forTwoSimpleList() {
        let sut = Solution()
        let augend = ListNode(2)
        let addend = ListNode(5)
        
        let result = sut.addTwoNumbers(augend, addend)
        
        XCTAssertEqual(ListNode(7), result)
    }

    func test_returnSum_forTwoSimpleList_withOverflow() {
        let sut = Solution()
        let augend = ListNode(4)
        let addend = ListNode(6)
        
        let result = sut.addTwoNumbers(augend, addend)
        
        let model = 10.listNode()
                
        XCTAssertEqual(model, result)
    }
    
    func test_returnSum_forTwoSignNumbers() {
        let sut = Solution()
        let augend = 24.listNode()
        let addend = 56.listNode()

        let result = sut.addTwoNumbers(augend, addend)

        let model = 80.listNode()

        XCTAssertEqual(model, result)
    }

    func test_returnSum_forTwoSignNumbers_withOverflow() {
        let sut = Solution()
        let augend = 89.listNode()
        let addend = 11.listNode()

        let result = sut.addTwoNumbers(augend, addend)

        let model = 100.listNode()

        XCTAssertEqual(model, result)
    }
}

extension Int {
    func listNode() -> ListNode {
        if self <= 0 {
            return ListNode(0)
        }

        let multiplier = 10
        var number = self
        var elements = [ListNode]()
        while Int(number / multiplier) > 0 {
            let rest = number % multiplier
            elements.append(ListNode(rest))
            
            number = Int(number / multiplier)
        }
        
        elements.append(ListNode(number))
        if elements.count > 1 {
            for index in 0..<elements.count - 1 {
                elements[index].next = elements[index + 1]
            }
        }
        
        return elements.first ?? ListNode(0)
    }

    init?(listNode: ListNode) {
        var result = 0
        var count = 0
        var currentElement = listNode
        repeat {
            if count > 18 {
                return nil
            }
            let multiplier = Int(pow(10, Double(count)))
            
            result += currentElement.val * multiplier
            
            currentElement = currentElement.next ?? ListNode(0)
            count += 1
        } while currentElement.next != nil
        
        let multiplier = Int(pow(10, Double(count)))
        result += currentElement.val * multiplier
        
        self = result
    }

}

class IntListNodeTests: XCTestCase {
    func test_returnNotZeroInt_onInitWithOneElement() {
        let sut = Int(listNode: ListNode(5))
        
        XCTAssertEqual(5, sut)
    }

    func test_returnNotZeroInt_onInitWithTwoElement() {
        let part2 = ListNode(1)
        let part1 = ListNode(0)
        part1.next = part2
        
        let sut = part1
        
        XCTAssertEqual(10, Int(listNode: sut) ?? 0)
    }
    
    func test_returnNotZeroInt_onInitWithThreeElement() {
        let part3 = ListNode(5)
        let part2 = ListNode(2)
        part2.next = part3
        let part1 = ListNode(1)
        part1.next = part2
        
        let sut = part1
        
        XCTAssertEqual(521, Int(listNode: sut) ?? 0)
    }
    
    func test_returnZeroListNode_forNegativeAndZeroNumber() {
        XCTAssertEqual(ListNode(0), (-5).listNode())
        XCTAssertEqual(ListNode(0), 0.listNode())
    }
    
    func test_returnListNodeWithOneElement_forSimpleNumber() {
        XCTAssertEqual(ListNode(5), 5.listNode())
    }
    
    func test_returnListNodeWithTwoElement_forTenNumber() {
        let part2 = ListNode(1)
        let part1 = ListNode(0)
        part1.next = part2
        
        print(part1.explanation())
        print(10.listNode().explanation())
        
        let result = 10.listNode()
        XCTAssertEqual(part1, result)
    }

    func test_returnListNodeWithThreeElement_forNumber() {
        let part3 = ListNode(5)
        let part2 = ListNode(2)
        part2.next = part3
        let part1 = ListNode(1)
        part1.next = part2
        
        print(part1.explanation())
        
        XCTAssertEqual(part1, 521.listNode())
    }
}
