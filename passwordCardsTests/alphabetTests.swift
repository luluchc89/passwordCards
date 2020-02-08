//
//  alphabetTests.swift
//  passwordCardsTests
//
//  Created by Ma. de Lourdes Chaparro Candiani on 06/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import XCTest
@testable import passwordCards

class alphabetTests: XCTestCase {


    func testCleanAlphabetWithNoDuplicates() {
        let alphabetString = "2468asdfg"
        let alphabet = Alphabet(alphabet: alphabetString, characterDictionary: [:])
        XCTAssert(alphabetString == alphabet.alphabet)
    }
    
    func testCleanAlphabetWithDuplicates() {
        let alphabetString = "22446688asdfg"
        let cleanedAlphabet = "2468asdfg"
        let alphabet = Alphabet(alphabet: alphabetString, characterDictionary: [:])
        XCTAssert(cleanedAlphabet == alphabet.alphabet)
    }
    
    func testCreateDictionary() {
        let alphabetString = "abc123"
        let alphabet: Alphabet = Alphabet(alphabet: alphabetString, characterDictionary: [:])
        XCTAssertEqual(alphabet.characterDictionary.count, 6)
        XCTAssertEqual(alphabet.characterDictionary[2], "c")
    }


}
