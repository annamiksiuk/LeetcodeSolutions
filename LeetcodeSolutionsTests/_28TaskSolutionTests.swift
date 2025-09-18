//
//  _28TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//28. Find the Index of the First Occurrence in a String
//
//Given two strings needle and haystack, return the index of the first occurrence of needle in haystack,
//or -1 if needle is not part of haystack.

import XCTest

extension Solution {
    //это решение быстрее
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !haystack.isEmpty, !needle.isEmpty, haystack.count >= needle.count else { return -1 }

        for index in 0...(haystack.count - needle.count) {
            let startIndex = String.Index(utf16Offset: index, in: haystack)
            let endIndex = String.Index(utf16Offset: index + needle.count - 1, in: haystack)
            if haystack[startIndex...endIndex] == needle {
                return index
            }
        }
        return -1
    }
    
//    это решение чуть медленнее, но тут более привычный способ получения индексов
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//        guard !haystack.isEmpty, !needle.isEmpty, haystack.count >= needle.count else { return -1 }
//
//        for index in 0...(haystack.count - needle.count) {
//            let startIndex = haystack.index(haystack.startIndex, offsetBy: index)
//            let endIndex = haystack.index(startIndex, offsetBy: needle.count)
//            if haystack[startIndex..<endIndex] == needle {
//                return index
//            }
//        }
//        return -1
//    }
}

class _28TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let haystack = "sadbutsad"
        let needle = "sad"
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, 0)
    }

    func test_example2() {
        let sut = Solution()
        
        let haystack = "leetcode"
        let needle = "leeto"
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }

    func test_example3() {
        let sut = Solution()
        
        let haystack = ""
        let needle = "leeto"
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }

    func test_example4() {
        let sut = Solution()
        
        let haystack = "leto"
        let needle = ""
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }

    func test_example5() {
        let sut = Solution()
        
        let haystack = "letoto"
        let needle = "to"
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, 2)
    }

    func test_example6() {
        let sut = Solution()
        
        let haystack = "ltetoto"
        let needle = "to"
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, 3)
    }

    func test_example7() {
        let sut = Solution()
        
        let haystack = "ltetotoa"
        let needle = "toa"
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, 5)
    }

    func test_example8() {
        let sut = Solution()
        
        let haystack = "toa"
        let needle = "toaa"
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }

    func test_example9() {
        let sut = Solution()
        
        let haystack = "toa"
        let needle = "toa"
        let result = sut.strStr(haystack, needle)
        
        XCTAssertEqual(result, 0)
    }
}
