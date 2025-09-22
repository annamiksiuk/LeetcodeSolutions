//
//  _20TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//20. Valid Parentheses
//
//Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Every close bracket has a corresponding open bracket of the same type.

import XCTest

extension Solution {
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        guard s.count % 2 == 0 else { return false }

        var stack = [Character]()
        for char in s {
            if stack.isEmpty {
                stack.append(char)
            } else {
                let pair = (stack[stack.count - 1], char)
                if pair == ("(", ")") || pair == ("[", "]") || pair == ("{", "}") {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
        }
        return stack.isEmpty
    }
}

class _20TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let s = "()"
        let result = sut.isValid(s)

        XCTAssertEqual(result, true)
    }

    func test_example2() {
        let sut = Solution()

        let s = "()[]{}"
        let result = sut.isValid(s)

        XCTAssertEqual(result, true)
    }

    func test_example3() {
        let sut = Solution()

        let s = "(]"
        let result = sut.isValid(s)

        XCTAssertEqual(result, false)
    }

    func test_example4() {
        let sut = Solution()

        let s = "([])"
        let result = sut.isValid(s)

        XCTAssertEqual(result, true)
    }

    func test_example5() {
        let sut = Solution()

        let s = "([)]"
        let result = sut.isValid(s)

        XCTAssertEqual(result, false)
    }
}
