//
//  _242TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//242. Valid Anagram
//
//Given two strings s and t, return true if t is an anagram of s, and false otherwise.

                            
import XCTest

extension Solution {
    //более быстрое решение, но только с малыми буквами английского алфавита
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var count = [Int](repeating: 0, count: 26)
        let aAscii = Int(Character("a").asciiValue!)

        for char in s {
            count[Int(char.asciiValue!) - aAscii] += 1
        }
        for char in t {
            count[Int(char.asciiValue!) - aAscii] -= 1
        }

        return count.allSatisfy { $0 == 0 }
    }
//    более медленное решение, но с любыми символами
//    func isAnagram(_ s: String, _ t: String) -> Bool {
//        guard s.count == t.count else { return false }
//
//        var hash = [Character: Int]()
//        for (index, value) in s.enumerated() {
//            if let count = hash[value] {
//                hash[value] = count + 1
//            } else {
//                hash[value] = 1
//            }
//        }
//        for (index, value) in t.enumerated() {
//            if let count = hash[value], count > 1 {
//                hash[value] = count - 1
//            } else {
//                hash.removeValue(forKey: value)
//            }
//        }
//
//        return hash.isEmpty
//    }
}

class _242TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let s = "anagram"
        let t = "nagaram"
        let result = sut.isAnagram(s, t)
        
        XCTAssertEqual(result, true)
    }

    func test_example2() {
        let sut = Solution()
        
        let s = "rat"
        let t = "car"
        let result = sut.isAnagram(s, t)
        
        XCTAssertEqual(result, false)
    }

    func test_example3() {
        let sut = Solution()
        
        let s = "anagram"
        let t = "nagaram"
        let result = sut.isAnagram(s, t)
        
        XCTAssertEqual(result, true)
    }

    func test_example4() {
        let sut = Solution()
        
        let s = "anagrrm"
        let t = "nagaram"
        let result = sut.isAnagram(s, t)
        
        XCTAssertEqual(result, false)
    }
}
