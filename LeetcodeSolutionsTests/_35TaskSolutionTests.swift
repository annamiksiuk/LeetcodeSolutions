//
//  _35TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//35. Search Insert Position
//
//
//Given a sorted array of distinct integers and a target value,
//return the index if the target is found.
//If not, return the index where it would be if it were inserted in order.
//
//You must write an algorithm with O(log n) runtime complexity.

import XCTest

extension Solution {
    //recursive
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        func binarySearch(_ left: Int, _ right: Int) -> Int {
            if left > right { return right + 1 }

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
//    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
//        var left = 0
//        var right = nums.count - 1
//        while left <= right {
//            let mid = left + (right - left) / 2
//            if nums[mid] == target {
//                return mid
//            } else if nums[mid] < target {
//                left = mid + 1
//            } else {
//                right = mid - 1
//            }
//        }
//        return right + 1
//    }
}

class _35TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let nums = [1,3,5,6]
        let target = 5
        let result = sut.searchInsert(nums, target)

        XCTAssertEqual(result, 2)
    }

    func test_example2() {
        let sut = Solution()

        let nums = [1,3,5,6]
        let target = 2
        let result = sut.searchInsert(nums, target)

        XCTAssertEqual(result, 1)
    }

    func test_example3() {
        let sut = Solution()

        let nums = [1,3,5,6]
        let target = 7
        let result = sut.searchInsert(nums, target)

        XCTAssertEqual(result, 4)
    }
}
