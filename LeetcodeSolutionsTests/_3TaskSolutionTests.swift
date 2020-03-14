//
//  _3TaskSolutionTests.swift
//  LeetcodeSolutionsTests
//
//  Created by Anna Miksiuk on 3/9/20.
//  Copyright © 2020 Anna Miksiuk. All rights reserved.
//

//https://leetcode.com/problems/longest-substring-without-repeating-characters/
//
//3. Longest Substring Without Repeating Characters
//
//Given a string, find the length of the longest substring without repeating characters.

import XCTest

extension Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        
        if Set(s).count == 1 {
            return 1
        }

        if Set(s).count == s.count {
            return s.count
        }

        let array = Array(s)
        var frame = String(array[0])
        var substring = ""
        var substringCount = 0
        var needRemoveFirstChar = false
        var index = 1

        while index < array.count {
            if needRemoveFirstChar {
                frame.removeFirst()
                needRemoveFirstChar = false
            } else {
                frame.append(array[index])
            }

            if frame.count != Set(frame).count {
                if substring.count > substringCount {
                    substringCount = substring.count
                    substring = ""
                }
                needRemoveFirstChar = true
            } else {
                substring = frame
                index += 1
            }
        }
        
        if substring.count > substringCount {
            return substring.count
        }

        return substringCount
    }
}

class _3TaskSolutionTests: XCTestCase {
    func test_returnZero_forEmptyString() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("")
        
        XCTAssertEqual(0, result)
    }

    func test_returnOne_forStringWithOneCharacter() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("f")
        
        XCTAssertEqual(1, result)
    }

    func test_returnOne_forStringWithRepeatOneCharacter() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("fffffffff")
        
        XCTAssertEqual(1, result)
    }

    func test_returnCountCharacters_forStringWithAllDifferentCharacters() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("abc")
        
        XCTAssertEqual(3, result)
    }

    func test_example1() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("abcabcbb")
        
        XCTAssertEqual(3, result)
    }

    func test_example2() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("bbbbb")
        
        XCTAssertEqual(1, result)
    }
    
    func test_example3() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("pwwkew")
        
        XCTAssertEqual(3, result)
    }

    func test_example4() {
        let sut = Solution()
        
        let result = sut.lengthOfLongestSubstring("aab")
        
        XCTAssertEqual(2, result)
    }
}
