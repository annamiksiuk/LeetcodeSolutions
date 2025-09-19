//
//  _136TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//136. Single Number
//
//Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
//
//You must implement a solution with a linear runtime complexity and use only constant extra space.

import XCTest

extension Solution {
//    XOR операции
//    func singleNumber(_ nums: [Int]) -> Int {
//        var result = 0
//        for num in nums {
//            result ^= num
//        }
//        return result
//    }

    func singleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }

        var hash = [Int: Int]()
        for num in nums {
            hash[num, default: 0] += 1
        }
        for pair in hash {
            if pair.value == 1 {
                return pair.key
            }
        }
        return -1
    }

//    func singleNumber(_ nums: [Int]) -> Int {
//        guard nums.count > 1 else { return nums[0] }
//
//        var sum = nums.reduce(into: 0) { $0 += $1 }
//        for i in 0..<(nums.count - 1) {
//            let num = nums[i]
//            for j in (i + 1)..<nums.count {
//                if nums[j] == num {
//                    sum -= num * 2
//                    break
//                }
//            }
//        }
//        return sum
//    }
}

class _136TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let nums = [2,2,1]
        let result = sut.singleNumber(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_example2() {
        let sut = Solution()
        
        let nums = [4,1,2,1,2]
        let result = sut.singleNumber(nums)
        
        XCTAssertEqual(result, 4)
    }

    func test_example3() {
        let sut = Solution()
        
        let nums = [1]
        let result = sut.singleNumber(nums)
        
        XCTAssertEqual(result, 1)
    }
}
