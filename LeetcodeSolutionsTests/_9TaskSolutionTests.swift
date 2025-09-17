//
//  _9TaskSolutionTests.swift
//  LeetcodeSolutionsTests
//
//  Created by Anna Miksiuk on 25.07.24.
//  Copyright © 2024 Anna Miksiuk. All rights reserved.
//

//https://leetcode.com/problems/palindrome-number/
//
//9. Palindrome Number
//
//Given an integer x, return true if x is a palindrome, and false otherwise.

import XCTest

extension Solution {
    func unsigned_reverse(_ x: Int) -> Int {
        guard x > 9 else { return x }

        var original = Int64(abs(x))
        var ten = String(x).count - 1
        var result: Int64 = 0

        while ten >= 0 {
            let a = Int64(original % 10)

            result += a * Int64(pow(Double(10), Double(ten)))

            original = (original - a) / 10
            ten -= 1
        }
        
        if result > Int(pow(Double(2), Double(31))) - 1 {
            return 0
        }
        
        return Int(result)
    }

    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        guard x > 9 else { return true }

        let y = unsigned_reverse(x)
        return x - y == 0
    }
}

class _9TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let result = sut.isPalindrome(121)
        
        XCTAssertTrue(result)
    }

    func test_example2() {
        let sut = Solution()
        
        let result = sut.isPalindrome(-121)
        
        XCTAssertFalse(result)
    }

    func test_example3() {
        let sut = Solution()
        
        let result = sut.isPalindrome(10)
        
        XCTAssertFalse(result)
    }

    func test_example4() {
        let sut = Solution()
        
        let result = sut.isPalindrome(0)
        
        XCTAssertTrue(result)
    }

    func test_example5() {
        let sut = Solution()
        
        let result = sut.isPalindrome(9)
        
        XCTAssertTrue(result)
    }

    func test_example6() {
        let sut = Solution()
        
        let result = sut.isPalindrome(11)
        
        XCTAssertTrue(result)
    }

    func test_example7() {
        let sut = Solution()
        
        let result = sut.isPalindrome(797)
        
        XCTAssertTrue(result)
    }

    func test_example8() {
        let sut = Solution()
        
        let result = sut.isPalindrome(7689867)
        
        XCTAssertTrue(result)
    }

    func test_example9() {
        let sut = Solution()
        
        let result = sut.isPalindrome(768867)
        
        XCTAssertTrue(result)
    }

    func test_example10() {
        let sut = Solution()
        
        let result = sut.isPalindrome(7688670)
        
        XCTAssertFalse(result)
    }

    func test_example11() {
        let sut = Solution()
        
        let x = Int(pow(Double(2), Double(31))) - 1
        let result = sut.isPalindrome(x)
        
        XCTAssertFalse(result)
    }
}
