//
//  _14TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//14. Longest Common Prefix
//
//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//

import XCTest

extension Solution {
    //меньшее время выполнения 0ms
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let minString = strs.min(by: { $0.count < $1.count }) else { return "" }

        var endIndex = minString.count
        while endIndex > 0 {
            let slice = minString.prefix(endIndex)
            let array = strs.filter({
                $0.prefix(endIndex) == slice
            })
            if array.count == strs.count {
                return String(slice)
            }
            endIndex -= 1
        }

        return ""
    }

//    большее время выполнения 10ms
//    func longestCommonPrefix(_ strs: [String]) -> String {
//        guard let first = strs.first else { return "" }
//
//        for (index, char) in first.enumerated() {
//            for str in strs.dropFirst() {
//                if index >= str.count || str[str.index(str.startIndex, offsetBy: index)] != char {
//                    return String(first.prefix(index))
//                }
//            }
//        }
//        return first
//    }
}

class _14TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let strs = ["flower","flow","flight"]
        let result = sut.longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "fl")
    }

    func test_example2() {
        let sut = Solution()
        
        let strs = ["dog","racecar","car"]
        let result = sut.longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "")
    }

    func test_example3() {
        let sut = Solution()
        
        let strs = ["d"]
        let result = sut.longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "d")
    }

    func test_example4() {
        let sut = Solution()
        
        let strs = ["", ""]
        let result = sut.longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "")
    }

    func test_example5() {
        let sut = Solution()
        
        let strs = ["ab", "a"]
        let result = sut.longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "a")
    }

    func test_example6() {
        let sut = Solution()
        
        let strs = [String]()
        let result = sut.longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "")
    }
}
