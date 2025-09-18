//
//  _125TaskSolutionTests.swift
//  LeetcodeSolutions
//
//  Created by Anna Miksiuk on 17.09.25.
//  Copyright © 2025 Anna Miksiuk. All rights reserved.
//

//125. Valid Palindrome
//
//A phrase is a palindrome if, after converting all uppercase letters
//into lowercase letters and removing all non-alphanumeric characters,
//it reads the same forward and backward. Alphanumeric characters include letters and numbers.
//
//Given a string s, return true if it is a palindrome, or false otherwise
                            
import XCTest

extension Solution {
    //Время 11ms, но больше памяти используется
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }

        let chars = Array(s.lowercased())
        var left = 0
        var right = chars.count - 1
        
        while left < right {
            if chars[left].isLetter || chars[left].isNumber {
                if chars[right].isLetter || chars[right].isNumber {
                    if chars[left] != chars[right] {
                        return false
                    }
                    left += 1
                    right -= 1
                } else {
                    right -= 1
                }
            } else {
                left += 1
            }
        }
        return true
    }

//    Время 19ms, но меньше памяти используется
//    func isPalindrome(_ s: String) -> Bool {
//        guard !s.isEmpty else { return true }
//        guard s.count > 1 else { return true }
//
//        var leftIndex = s.startIndex
//        var rightIndex = s.index(before: s.endIndex)
//        
//        while leftIndex < rightIndex {
//            if s[leftIndex].isLetter || s[leftIndex].isNumber {
//                if s[rightIndex].isLetter || s[rightIndex].isNumber {
//                    if s[leftIndex].lowercased() != s[rightIndex].lowercased() {
//                        return false
//                    }
//                    leftIndex = s.index(after: leftIndex)
//                    rightIndex = s.index(before: rightIndex)
//                } else {
//                    rightIndex = s.index(before: rightIndex)
//                }
//            } else {
//                leftIndex = s.index(after: leftIndex)
//            }
//        }
//        return true
//    }
}

class _125TaskSolutionTests: XCTestCase {
    func test_example1() {
        let sut = Solution()
        
        let string = "A man, a plan, a canal: Panama"

        let result = sut.isPalindrome(string)
        
        XCTAssertEqual(result, true)
    }

    func test_example2() {
        let sut = Solution()
        
        let string = "race a car"

        let result = sut.isPalindrome(string)
        
        XCTAssertEqual(result, false)
    }

    func test_example3() {
        let sut = Solution()
        
        let string = "A man4, a plan, a canal: Pa4nama"

        let result = sut.isPalindrome(string)
        
        XCTAssertEqual(result, true)
    }

    func test_example4() {
        let sut = Solution()
        
        let string = " "

        let result = sut.isPalindrome(string)
        
        XCTAssertEqual(result, true)
    }
}
