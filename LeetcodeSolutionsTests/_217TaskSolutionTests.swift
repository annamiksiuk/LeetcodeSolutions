//
//  _217TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//217. Contains Duplicate
//
//Given an integer array nums, return true if any value appears
//at least twice in the array, and return false if every element is distinct.
//

import XCTest

extension Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var seen = Set<Int>()
        for num in nums {
            if seen.contains(num) {
                return true
            }
            seen.insert(num)
        }
        return false
    }

//    func containsDuplicate(_ nums: [Int]) -> Bool {
//        guard nums.count > 1 else { return false }
//
//        return Set(nums).count != nums.count
//    }
}

class _217TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let nums = [1,2,3,1]
        let result = sut.containsDuplicate(nums)
        
        XCTAssertEqual(result, true)
    }

    func test_example2() {
        let sut = Solution()
        
        let nums = [1,2,3,4]
        let result = sut.containsDuplicate(nums)
        
        XCTAssertEqual(result, false)
    }

    func test_example3() {
        let sut = Solution()
        
        let nums = [1,1,1,3,3,4,3,2,4,2]
        let result = sut.containsDuplicate(nums)
        
        XCTAssertEqual(result, true)
    }

    func test_example4() {
        let sut = Solution()
        
        let nums = [1]
        let result = sut.containsDuplicate(nums)
        
        XCTAssertEqual(result, false)
    }
}
