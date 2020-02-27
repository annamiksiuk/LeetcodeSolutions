//
//  SolutionCountVowelsPermutationTests.swift
//  LeetcodeSolutionsTests
//
//  Created by Anna Miksiuk on 2/25/20.
//  Copyright © 2020 Anna Miksiuk. All rights reserved.
//

import XCTest

//https://leetcode.com/problems/count-vowels-permutation/
//
//Given an integer n, your task is to count how many strings of length n can be formed under the following rules:
//
//Each character is a lower case vowel ('a', 'e', 'i', 'o', 'u')
//Each vowel 'a' may only be followed by an 'e'.
//Each vowel 'e' may only be followed by an 'a' or an 'i'.
//Each vowel 'i' may not be followed by another 'i'.
//Each vowel 'o' may only be followed by an 'i' or a 'u'.
//Each vowel 'u' may only be followed by an 'a'.
//Since the answer may be too large, return it modulo 10^9 + 7.
//

extension Solution {
    func permutationCombination(_ n: Int) -> [String] {
        guard n > 0, n <= 2 * 10000 else { return [] }

        let vowels = ["a", "e", "i", "o", "u"]

        if n == 1 {
            return vowels
        }

        let prevArray = permutationCombination(n - 1)

        var newElements = prevArray
        for index in 0..<prevArray.count {
            for element in vowels {
                if !newElements.contains(prevArray[index] + element) {
                    newElements.append(prevArray[index] + element)
                }
                if !newElements.contains(element + prevArray[index]) {
                    newElements.append(element + prevArray[index])
                }
            }
        }

        for element in ["aa", "ai", "ao", "au"] {
            newElements = newElements.filter( { !$0.contains(element) } )
        }

        for element in ["ee", "eo", "eu"] {
            newElements = newElements.filter( { !$0.contains(element) } )
        }

        newElements = newElements.filter( { !$0.contains("ii") } )

        for element in ["oo", "oe", "oa"] {
            newElements = newElements.filter( { !$0.contains(element) } )
        }

        for element in ["uu", "ue", "uo", "ui"] {
            newElements = newElements.filter( { !$0.contains(element) } )
        }

        newElements = newElements.filter( { $0.count != n - 1 } )

        print("Explanation - \(newElements)")
        return newElements
    }

    func countVowelPermutation(_ n: Int) -> Int {
        let permutations = permutationCombination(n)
        return permutations.count % Int((pow(Double(10), 9) + 7))
    }
}

class SolutionCountVowelsPermutationTests: XCTestCase {
    func test_returnZero_forZeroInput() {
        let sut = Solution()
        
        let count = sut.countVowelPermutation(0)
        
        XCTAssertEqual(0, count)
    }

    func test_returnZero_forNegativeInput() {
        let sut = Solution()
        
        let count = sut.countVowelPermutation(-5)
        
        XCTAssertEqual(0, count)
    }

    func test_returnZero_forMoreUpperLimitInput() {
        let sut = Solution()
        
        let count = sut.countVowelPermutation(2 * 10000 + 1)
        
        XCTAssertEqual(0, count)
    }

    func test_returnCountDifferentVowels_forInputEqualToOne() {
        let sut = Solution()
        
        let count = sut.countVowelPermutation(1)
        
        XCTAssertEqual(5, count)
    }

    func test_returnCountDifferentVowels_forInputEqualToTwo() {
        let sut = Solution()

        let count = sut.countVowelPermutation(2)

        XCTAssertEqual(10, count)
    }

    func test_returnCountDifferentVowels_forInputEqualToFive() {
        let sut = Solution()

        let count = sut.countVowelPermutation(5)

        XCTAssertEqual(68, count)
    }
    
    //---test permintations
    
    func test_eachVowelA_mayOnlyBeFollowed_byE() {
        let sut = Solution()
        
        let permitations = sut.permutationCombination(2)
        
        XCTAssertEqual(1, permitations.filter( {$0.contains("ae")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("aa")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("ai")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("ao")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("au")} ).count)
    }

    func test_eachVowelE_mayOnlyBeFollowed_byAorI() {
        let sut = Solution()
        
        let permitations = sut.permutationCombination(2)
        
        XCTAssertEqual(1, permitations.filter( {$0.contains("ea")} ).count)
        XCTAssertEqual(1, permitations.filter( {$0.contains("ei")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("ee")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("eo")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("eu")} ).count)
    }

    func test_eachVowelI_mayNotBeFollowed_byAnotherI() {
        let sut = Solution()
        
        let permitations = sut.permutationCombination(2)
        
        XCTAssertEqual(0, permitations.filter( {$0.contains("ii")} ).count)
    }
    
    func test_eachVowelO_mayOnlyBeFollowed_byIorU() {
        let sut = Solution()
        
        let permitations = sut.permutationCombination(2)
        
        XCTAssertEqual(1, permitations.filter( {$0.contains("oi")} ).count)
        XCTAssertEqual(1, permitations.filter( {$0.contains("ou")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("oo")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("oe")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("oa")} ).count)
    }

    func test_eachVowelU_mayOnlyBeFollowed_byA() {
        let sut = Solution()
        
        let permitations = sut.permutationCombination(2)
        
        XCTAssertEqual(1, permitations.filter( {$0.contains("ua")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("uu")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("ue")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("uo")} ).count)
        XCTAssertEqual(0, permitations.filter( {$0.contains("ui")} ).count)
    }

    func test_rightExplanationForInputEqualToOne() {
        let sut = Solution()
        
        let permitations = sut.permutationCombination(1)
        
        XCTAssertEqual(Set(["a", "e", "i", "o", "u"]), Set(permitations))
    }
    
    func test_rightExplanationForInputEqualToTwo() {
        let sut = Solution()
        
        let permitations = sut.permutationCombination(2)
        
        XCTAssertEqual(Set(["ae", "ea", "ei", "ia", "ie", "io", "iu", "oi", "ou", "ua"]), Set(permitations))
    }
}
