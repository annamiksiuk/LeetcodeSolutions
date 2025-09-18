//
//  _88TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//88. Merge Sorted Array
//
//You are given two integer arrays nums1 and nums2, sorted in non-decreasing order,
//and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
//
//Merge nums1 and nums2 into a single array sorted in non-decreasing order.
//
//The final sorted array should not be returned by the function,
//but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n,
//where the first m elements denote the elements that should be merged,
//and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

import XCTest

extension Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if m == 0 && n == 0 { return }
        if n == 0 { return }

        var newIndex = m + n - 1
        var i = m - 1
        var j = n - 1
        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[newIndex] = nums1[i]
                i -= 1
            } else {
                nums1[newIndex] = nums2[j]
                j -= 1
            }
            newIndex -= 1
        }
    }
}

class _88TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        var nums1 = [1,2,3,0,0,0]
        let m = 3
        let nums2 = [2,5,6]
        let n = 3
        
        sut.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [1,2,2,3,5,6])
    }

    func test_example2() {
        let sut = Solution()
        
        var nums1 = [1]
        let m = 1
        let nums2 = [Int]()
        let n = 0
        
        sut.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [1])
    }

    func test_example3() {
        let sut = Solution()
        
        var nums1 = [0]
        let m = 0
        let nums2 = [1]
        let n = 1
        
        sut.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [1])
    }

    func test_example4() {
        let sut = Solution()
        
        var nums1 = [4,5,6,0,0]
        let m = 3
        let nums2 = [1,2]
        let n = 2
        
        sut.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [1,2,4,5,6])
    }

    func test_example5() {
        let sut = Solution()
        
        var nums1 = [1,2,3,0,0]
        let m = 3
        let nums2 = [5,6]
        let n = 2
        
        sut.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [1,2,3,5,6])
    }
}
