//
//  _278TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//278. First Bad Version
//
//You are a product manager and currently leading a team to develop a new product.
//Unfortunately, the latest version of your product fails the quality check.
//Since each version is developed based on the previous version, all the versions after a bad version are also bad.
//
//Suppose you have n versions [1, 2, ..., n] and you want to find out
//the first bad one, which causes all the following ones to be bad.
//
//You are given an API bool isBadVersion(version) which returns whether version is bad.
//Implement a function to find the first bad version.
//You should minimize the number of calls to the API.

import XCTest

//The knows API is defined in the parent class VersionControl.
//    func isBadVersion(_ version: Int) -> Bool{}

func isBadVersion(_ version: Int) -> Bool {
    version == 1
}

extension Solution {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left <= right {
            let mid = left + (right - left) / 2
            if isBadVersion(mid) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
}

class _278TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()

        let result = sut.firstBadVersion(1)

        XCTAssertEqual(result, 1)
    }
}
