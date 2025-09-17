//
//  _27TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//27. Remove Element
//Given an integer array nums and an integer val, remove all occurrences of val in nums in-place.
//The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.
//Consider the number of elements in nums which are not equal to val be k,
//to get accepted, you need to do the following things:
//Change the array nums such that the first k elements of nums contain the elements which are not equal to val.
//The remaining elements of nums are not important as well as the size of nums.
//Return k.
//

import XCTest

extension Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        guard nums.count > 1 else {
            return nums[0] == val ? 0 : 1
        }

        var newIndex = 0
        for index in 0..<nums.count {
            if nums[index] != val {
                nums[newIndex] = nums[index]
                newIndex += 1
            }
        }
        return newIndex
    }
}

class _27TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        var nums = [3,2,2,3]
        let result = sut.removeElement(&nums, 3)
        
        XCTAssertEqual(result, 2)
    }

    func test_example2() {
        let sut = Solution()

        var nums = [0,1,2,2,3,0,4,2]
        let result = sut.removeElement(&nums, 2)
        
        XCTAssertEqual(result, 5)
    }

    func test_example3() {
        let sut = Solution()
        
        var nums = [0]
        let result = sut.removeElement(&nums, 0)
        
        XCTAssertEqual(result, 0)
    }

    func test_example4() {
        let sut = Solution()
        
        var nums = [Int]()
        let result = sut.removeElement(&nums, 2)
        
        XCTAssertEqual(result, 0)
    }

    func test_example5() {
        let sut = Solution()
        
        var nums = [10, 10]
        let result = sut.removeElement(&nums, 10)
        
        XCTAssertEqual(result, 0)
    }

    func test_example6() {
        let sut = Solution()
        
        var nums = [0]
        let result = sut.removeElement(&nums, 5)
        
        XCTAssertEqual(result, 1)
    }

    func test_example7() {
        let sut = Solution()

        var nums = [2, 5, 3, 3, 4, 5, 5, 5, 5, 6, 8, 5, 8]
        let expectedNums = [2, 3, 3, 4, 6, 8, 8]
        let value = 5

        let result = sut.removeElement(&nums, value)

        XCTAssertEqual(result, expectedNums.count)

        nums = nums.filter { $0 != value }
        for i in 0..<result {
            XCTAssertEqual(nums[i], expectedNums[i])
        }
    }
}
