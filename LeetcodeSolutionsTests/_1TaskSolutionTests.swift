//
//  _1TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//


//https://leetcode.com/problems/two-sum/description/
//
//1. Two Sum
//
//Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//You can return the answer in any order.
//
//Example 1:
//
//Input: nums = [2,7,11,15], target = 9
//Output: [0,1]
//Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
//
//Example 2:
//
//Input: nums = [3,2,4], target = 6
//Output: [1,2]
//
//Example 3:
//
//Input: nums = [3,3], target = 6
//Output: [0,1]
//
//Constraints:
//2 <= nums.length <= 104
//-109 <= nums[i] <= 109
//-109 <= target <= 109
//Only one valid answer exists.

import XCTest

extension Solution {
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [] }

//        key - number, value = index
        var map = [Int: Int]()
        for index in 0..<nums.count {
            let key = nums[index]
            let sub = target - key
            if let nextIndex = map[sub] {
                return [index, nextIndex]
            }
            map[key] = index
        }

        return []
    }
}

class _1TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let result = sut.twoSum2([2,7,11,15], 9)
        
        XCTAssertEqual(Set(result), Set([0,1]))
    }

    func test_example2() {
        let sut = Solution()
        
        let result = sut.twoSum2([3,2,4], 6)
        
        XCTAssertEqual(Set(result), Set([1,2]))
    }

    func test_example3() {
        let sut = Solution()
        
        let result = sut.twoSum2([3,3], 6)
        
        XCTAssertEqual(Set(result), Set([0,1]))
    }

    func test_example4() {
        let sut = Solution()
        
        let result = sut.twoSum2([3], 6)
        
        XCTAssertEqual(result, [])
    }

    func test_example5() {
        let sut = Solution()
        
        let result = sut.twoSum2([-10, 3, 20], 10)
        
        XCTAssertEqual(Set(result), Set([0, 2]))
    }
}
