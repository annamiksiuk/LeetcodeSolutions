//
//  _704TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//704. Binary Search
//
//Given an array of integers nums which is sorted in ascending order,
//and an integer target, write a function to search target in nums.
//If target exists, then return its index. Otherwise, return -1.
//
//You must write an algorithm with O(log n) runtime complexity.

import XCTest

extension Solution {
    //recursive
    func search(_ nums: [Int], _ target: Int) -> Int {
        func binarySearch(_ left: Int, _ right: Int) -> Int {
            if left > right { return -1 }

            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                return binarySearch(mid + 1, right)
            } else {
                return binarySearch(left, mid - 1)
            }
        }

        return binarySearch(0, nums.count - 1)
    }

    //iteracii
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        guard !nums.isEmpty else { return -1 }
//
//        var firstIndex = 0
//        var lastIndex = nums.count - 1
//        while firstIndex <= lastIndex {
//            let midIndex = firstIndex + (lastIndex - firstIndex) / 2
//            if nums[midIndex] == target {
//                return midIndex
//            } else if nums[midIndex] > target {
//                lastIndex = midIndex - 1
//            } else {
//                firstIndex = midIndex + 1
//            }
//        }
//        return -1
//    }
}

class _704TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let nums = [-1,0,3,5,9,12]
        let target = 9
        let result = sut.search(nums, target)

        XCTAssertEqual(result, 4)
    }

    func test_example2() {
        let sut = Solution()

        let nums = [-1,0,3,5,9,12]
        let target = 2
        let result = sut.search(nums, target)

        XCTAssertEqual(result, -1)
    }

    func test_example3() {
        let sut = Solution()

        let nums = [Int]()
        let target = 2
        let result = sut.search(nums, target)

        XCTAssertEqual(result, -1)
    }

    func test_example4() {
        let sut = Solution()

        let nums = [2]
        let target = 2
        let result = sut.search(nums, target)

        XCTAssertEqual(result, 0)
    }

    func test_example5() {
        let sut = Solution()

        let nums = [-1,0,3,5,6,9,12,15,17,19,20,21,23,25,26]
        let target = 9
        let result = sut.search(nums, target)

        XCTAssertEqual(result, 5)
    }

    func test_example6() {
        let sut = Solution()

        let nums = [2]
        let target = 3
        let result = sut.search(nums, target)

        XCTAssertEqual(result, -1)
    }

    func test_example7() {
        let sut = Solution()

        let nums = [2,5]
        let target = 5
        let result = sut.search(nums, target)

        XCTAssertEqual(result, 1)
    }

    func test_example8() {
        let sut = Solution()

        let nums = [2,5]
        let target = 0
        let result = sut.search(nums, target)

        XCTAssertEqual(result, -1)
    }
}
