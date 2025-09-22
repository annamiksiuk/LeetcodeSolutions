//
//  _70TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//70. Climbing Stairs
//
//You are climbing a staircase. It takes n steps to reach the top.
//
//Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

import XCTest

extension Solution {
    //мемоизация
    func climbStairs(_ n: Int) -> Int {
        var memo = [Int: Int]()
        
        func helper(_ k: Int) -> Int {
            if k <= 2 { return k }
            if let cached = memo[k] { return cached }

            memo[k] = helper(k - 1) + helper(k - 2)
            return memo[k]!
        }
        
        return helper(n)
    }

//    recursive - Time Limit Exceeded
//    func climbStairs(_ n: Int) -> Int {
//        guard n > 2 else { return n }
//
//        return climbStairs(n - 1) + climbStairs(n - 2)
//    }

//    iteracii
//    func climbStairs(_ n: Int) -> Int {
//        if n <= 2 { return n }
//        var a = 1
//        var b = 2
//
//        for _ in 3...n {
//            let temp = a + b
//            a = b
//            b = temp
//        }
//
//        return b
//    }
}

class _70TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let result = sut.climbStairs(2)

        XCTAssertEqual(result, 2)
    }

    func test_example2() {
        let sut = Solution()

        let result = sut.climbStairs(3)

        XCTAssertEqual(result, 3)
    }

    func test_example3() {
        let sut = Solution()

        let result = sut.climbStairs(4)

        XCTAssertEqual(result, 5)
    }

    func test_example4() {
        let sut = Solution()

        let result = sut.climbStairs(5)

        XCTAssertEqual(result, 8)
    }
}
