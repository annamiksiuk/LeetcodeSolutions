//
//  _4TaskSolutionTests.swift
//  LeetcodeSolutionsTests
//
//  Created by Anna Miksiuk on 3/18/20.
//  Copyright © 2020 Anna Miksiuk. All rights reserved.
//

//https://leetcode.com/problems/median-of-two-sorted-arrays/
//
//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//
//You may assume nums1 and nums2 cannot be both empty.
//
//Example 1:
//
//nums1 = [1, 3]
//nums2 = [2]
//
//The median is 2.0
//Example 2:
//
//nums1 = [1, 2]
//nums2 = [3, 4]
//
//The median is (2 + 3)/2 = 2.5

import XCTest

extension Solution {
    func generalArray(_ array1: [Int], _ array2: [Int]) -> [Int] {
        var nums1 = array1
        var nums2 = array2
        var array = [Int]()
        
        while !nums1.isEmpty || !nums2.isEmpty {
            if let firstNums1 = nums1.first, let firstNums2 = nums2.first {
                if firstNums1 <= firstNums2 {
                    array.append(firstNums1)
                    nums1.removeFirst()
                } else {
                    array.append(firstNums2)
                    nums2.removeFirst()
                }
            } else if let firstNums1 = nums1.first {
                array.append(firstNums1)
                nums1.removeFirst()
            } else if let firstNums2 = nums2.first {
                array.append(firstNums2)
                nums2.removeFirst()
            }
        }
        
        return array
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let generalNums = generalArray(nums1, nums2)
        
        let generalCount = generalNums.count
        
        if generalCount % 2 == 0 {
            let item1 = generalNums[generalCount / 2]
            let item2 = generalNums[generalCount / 2 - 1]
            return Double(item1 + item2) / 2
        } else {
            return Double(generalNums[Int(generalCount / 2)])
        }
    }
}

class _4TaskSolutionTests: XCTestCase {
    func test_example1() {
        let array1 = [1, 3]
        let array2 = [2]
        let sut = Solution()

        let mediana = sut.findMedianSortedArrays(array1, array2)
        
        XCTAssertEqual(2, mediana)
    }

    func test_example2() {
        let array1 = [1, 2]
        let array2 = [3, 4]
        let sut = Solution()

        let mediana = sut.findMedianSortedArrays(array1, array2)
        
        XCTAssertEqual(2.5, mediana)
    }

    func test_example3() {
        let array1 = [1, 5]
        let array2 = [Int]()
        let sut = Solution()

        let mediana = sut.findMedianSortedArrays(array1, array2)
        
        XCTAssertEqual(3, mediana)
    }

    func test_example4() {
        let array1 = [Int]()
        let array2 = [5]
        let sut = Solution()

        let mediana = sut.findMedianSortedArrays(array1, array2)
        
        XCTAssertEqual(5, mediana)
    }
}
