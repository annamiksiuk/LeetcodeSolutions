//
//  _7TaskSolutionTests.swift
//  LeetcodeSolutionsTests
//
//  Created by Anna Miksiuk on 4/11/20.
//  Copyright © 2020 Anna Miksiuk. All rights reserved.
//

//https://leetcode.com/problems/reverse-integer/
//
//7. Reverse Integer
//
//Given a 32-bit signed integer, reverse digits of an integer.

import XCTest

extension Solution {
    func reverse(_ x: Int) -> Int {
        if x > -10 && x < 10 {
            return x
        }

        var original = abs(x)
        var ten = String(original).count - 1
        var result = 0

        while ten >= 0 {
            let a = original % 10

            result += a * Int(pow(Double(10), Double(ten)))

            original = (original - a) / 10
            ten -= 1
        }
        
        if result > Int(pow(Double(2), Double(31))) - 1 {
            return 0
        }
        
        return x < 0 ? -1 * result : result
    }
}

class _7TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let result = sut.reverse(123)
        
        XCTAssertEqual(321, result)
    }

    func test_example2() {
        let sut = Solution()

        let result = sut.reverse(-123)

        XCTAssertEqual(-321, result)
    }

    func test_example3() {
        let sut = Solution()
        
        let result = sut.reverse(0)
        
        XCTAssertEqual(0, result)
    }
    
    func test_example4() {
        let sut = Solution()
        
        let result = sut.reverse(5)
        
        XCTAssertEqual(5, result)
    }
    
    func test_example5() {
        let sut = Solution()
        
        let result = sut.reverse(-5)
        
        XCTAssertEqual(-5, result)
    }

    func test_example6() {
        let sut = Solution()
        
        let result = sut.reverse(120)
        
        XCTAssertEqual(21, result)
    }

    func test_example7() {
        let sut = Solution()
        
        let result = sut.reverse(Int(pow(Double(2),Double(31))))
        
        XCTAssertEqual(0, result)
    }

    func test_example8() {
        let sut = Solution()
        
        let result = sut.reverse(-1 * Int(pow(Double(2),Double(31))))
        
        XCTAssertEqual(0, result)
    }

    func test_example9() {
        let sut = Solution()
        
        let result = sut.reverse(1534236469)
        
        XCTAssertEqual(0, result)
    }
}
