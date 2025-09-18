//
//  _283TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//283. Move Zeroes
//
//Given an integer array nums, move all 0's to the end of it
//while maintaining the relative order of the non-zero elements.
//
//Note that you must do this in-place without making a copy of the array.

import XCTest

extension Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }

        var newIndex = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[newIndex] = nums[i]
                newIndex += 1
            }
        }
        while newIndex < nums.count {
            nums[newIndex] = 0
            newIndex += 1
        }
    }
}

class _283TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        var nums = [0,1,0,3,12]

        sut.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [1,3,12,0,0])
    }

    func test_example2() {
        let sut = Solution()
        
        var nums = [0]

        sut.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [0])
    }

    func test_example3() {
        let sut = Solution()
        
        var nums = [Int]()

        sut.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [])
    }

    func test_example4() {
        let sut = Solution()
        
        var nums = [0,0,0]

        sut.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [0,0,0])
    }

    func test_example5() {
        let sut = Solution()
        
        var nums = [1,2,3]

        sut.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [1,2,3])
    }

    func test_example6() {
        let sut = Solution()
        
        var nums = [0,1]

        sut.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [1,0])
    }
}
