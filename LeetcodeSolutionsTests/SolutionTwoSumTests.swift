//
//  SolutionTwoSumTests.swift
//  LeetcodeSolutionsTests
//
//  Created by Anna Miksiuk on 2/25/20.
//  Copyright © 2020 Anna Miksiuk. All rights reserved.
//

import XCTest

//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//Example:
//
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [] }

        if nums.count == 2 {
            if nums[0] + nums[1] == target {
                return [0, 1]
            }
        }

        for firstIndex in 0..<nums.count - 1 {
            for secondIndex in (firstIndex + 1)..<nums.count {
                let sum = nums[firstIndex] + nums[secondIndex]
                if sum == target {
                    return [firstIndex, secondIndex]
                }
            }
        }
        
        return []
    }
}

class SolutionTwoSumTests: XCTestCase {
    func test_returnEmptyResult_forEmptyArray() {
        let sut = Solution()
        
        let indices = sut.twoSum([], 5)
        
        XCTAssertEqual([], indices)
    }

    func test_returnEmptyResult_whenArrayExistsOneElement() {
        let sut = Solution()
        
        let indices = sut.twoSum([5], 5)
        
        XCTAssertEqual([], indices)
    }
    
    func test_solutionExistsOnlyTwoIndex() {
        let sut = Solution()

        let indices = sut.twoSum([1, 1, 1, 2], 3)

        XCTAssertEqual(2, indices.count)
    }

    func test_resultExistsDifferentIndices() {
        let sut = Solution()

        let indices = sut.twoSum([2, 3], 5)

        XCTAssertNotEqual(indices[0], indices[1])
    }

    func test_sumElementsForIndicesEqualSpecificTarget() {
        let sut = Solution()

        let initial = [2, 7, 8, 3]
        let target = 10
        let indices = sut.twoSum(initial, target)

        XCTAssertEqual(target, initial[indices[0]] + initial[indices[1]])
    }

    func test_returnEmptyResult_whenSumAnyTwoElementsNotEqualSpecificTarget() {
        let sut = Solution()

        let indices = sut.twoSum([2, 7, 8, 3], 25)

        XCTAssertEqual([], indices)
    }

    func test_sumTwoLastElemetsInArrayEqualSpecificTarget() {
        let sut = Solution()

        let initial = [2, 7, 8, 3]
        let target = 11
        let indices = sut.twoSum(initial, target)

        XCTAssertEqual(target, initial[indices[0]] + initial[indices[1]])
    }
}
