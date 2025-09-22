//
//  _746TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//746. Min Cost Climbing Stairs
//
//You are given an integer array cost where cost[i] is the cost of ith step on a staircase.
//Once you pay the cost, you can either climb one or two steps.
//
//You can either start from the step with index 0, or the step with index 1.
//
//Return the minimum cost to reach the top of the floor.

import XCTest

extension Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var memo = [Int: Int]()

        func helper(_ k: Int) -> Int {
            if k < 0 { return 0 }
            if k == 0 || k == 1 { return cost[k] }
            if let cached = memo[k] { return cached }

            memo[k] = cost[k] + min(helper(k - 1), helper(k - 2))
            return memo[k]!
        }

        return min(helper(cost.count - 1), helper(cost.count - 2))
    }

//    func minCostClimbingStairs(_ cost: [Int]) -> Int {
//        var a = cost[0]
//        var b = cost[1]
//        for i in 2..<cost.count {
//            let next = cost[i] + min(a, b)
//            a = b
//            b = next
//        }
//
//        return min(a, b)
//    }
}

class _746TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let cost = [10,15,20]
        let result = sut.minCostClimbingStairs(cost)

        XCTAssertEqual(result, 15)
    }

    func test_example2() {
        let sut = Solution()

        let cost = [1,100,1,1,1,100,1,1,100,1]
        let result = sut.minCostClimbingStairs(cost)

        XCTAssertEqual(result, 6)
    }

    func test_example3() {
        let sut = Solution()

        let cost = [0,1,0,1]
        let result = sut.minCostClimbingStairs(cost)

        XCTAssertEqual(result, 0)
    }

    func test_example4() {
        let sut = Solution()

        let cost = [0,0,1,1]
        let result = sut.minCostClimbingStairs(cost)

        XCTAssertEqual(result, 1)
    }
}
