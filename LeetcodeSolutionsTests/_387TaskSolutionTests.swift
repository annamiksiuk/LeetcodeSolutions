//
//  _387TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//387. First Unique Character in a String
//
//Given a string s, find the first non-repeating character in it and return its index.
//If it does not exist, return -1.

import XCTest

extension Solution {
    //более быстрое решение для англ.строчных букв
    func firstUniqChar(_ s: String) -> Int {
        guard s.count > 0 else { return -1 }
        guard s.count > 1 else { return 0 }

        var freq = [Int](repeating: 0, count: 26)
        let aAscii = Int(Character("a").asciiValue!)

        for char in s {
            freq[Int(char.asciiValue!) - aAscii] += 1
        }

        for (i, char) in s.enumerated() {
            if freq[Int(char.asciiValue!) - aAscii] == 1 {
                return i
            }
        }
        
        return -1
    }
//    более медленное решение, но для любых символов
//    func firstUniqChar(_ s: String) -> Int {
//        guard s.count > 0 else { return -1 }
//        guard s.count > 1 else { return 0 }
//
//        var hash = [Character: Int]()
//        for char in s {
//            if let count = hash[char] {
//                hash[char] = count + 1
//            } else {
//                hash[char] = 1
//            }
//        }
//
//        for (index, char) in s.enumerated() {
//            if hash[char] == 1 {
//                return index
//            }
//        }
//        return -1
//    }
}

class _387TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let s = "leetcode"
        let result = sut.firstUniqChar(s)
        
        XCTAssertEqual(result, 0)
    }

    func test_example2() {
        let sut = Solution()
        
        let s = "loveleetcode"
        let result = sut.firstUniqChar(s)
        
        XCTAssertEqual(result, 2)
    }

    func test_example3() {
        let sut = Solution()
        
        let s = "aabb"
        let result = sut.firstUniqChar(s)
        
        XCTAssertEqual(result, -1)
    }

    func test_example4() {
        let sut = Solution()
        
        let s = ""
        let result = sut.firstUniqChar(s)
        
        XCTAssertEqual(result, -1)
    }
}
