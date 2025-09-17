//
//  _26TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//26. Remove Duplicates from Sorted Array
//Given an integer array nums sorted in non-decreasing order,
//remove the duplicates in-place such that each unique element appears only once.
//The relative order of the elements should be kept the same.
//Then return the number of unique elements in nums.
//
//Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
//
//Change the array nums such that the first k elements of nums contain
//the unique elements in the order they were present in nums initially.
//The remaining elements of nums are not important as well as the size of nums.
//Return k.

import XCTest

extension Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }

        var newIndex = 1
        for index in 1..<nums.count {
            let item = nums[index]
            if nums[index - 1] != item {
                nums[newIndex] = item
                newIndex += 1
            }
        }
        return newIndex
    }
}

class _26TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        var nums = [1,1,2]
        let result = sut.removeDuplicates(&nums)
        
        XCTAssertEqual(result, 2)
    }

    func test_example2() {
        let sut = Solution()

        var nums = [0,0,1,1,1,2,2,3,3,4]
        let result = sut.removeDuplicates(&nums)
        
        XCTAssertEqual(result, 5)
    }

    func test_example3() {
        let sut = Solution()
        
        var nums = [0]
        let result = sut.removeDuplicates(&nums)
        
        XCTAssertEqual(result, 1)
    }

    func test_example4() {
        let sut = Solution()
        
        var nums = [Int]()
        let result = sut.removeDuplicates(&nums)
        
        XCTAssertEqual(result, 0)
    }

    func test_example5() {
        let sut = Solution()
        
        var nums = [10, 10]
        let result = sut.removeDuplicates(&nums)
        
        XCTAssertEqual(result, 1)
    }

    func test_example6() {
        let sut = Solution()

        var nums = [2, 3, 3, 4, 5, 5, 5, 5, 6, 8, 8]
        let expectedNums = [2, 3, 4, 5, 6, 8]

        let result = sut.removeDuplicates(&nums)

        XCTAssertEqual(result, expectedNums.count)

        for i in 0..<result {
            XCTAssertEqual(nums[i], expectedNums[i])
        }
    }
}
