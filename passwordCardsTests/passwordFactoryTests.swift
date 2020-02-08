//
//  passwordFactoryTests.swift
//  passwordCardsTests
//
//  Created by Ma. de Lourdes Chaparro Candiani on 06/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import XCTest
import CryptoKit
@testable import passwordCards

class passwordFactoryTests: XCTestCase {
    var alphabet: Alphabet = Alphabet(alphabet: "abc1234", characterDictionary: [:])
    let key: SymmetricKey = SymmetricKey(size: .bits256)

    
    func testValidIndexGeneration() {
        var passwordFactory = PasswordFactory(alphabet: alphabet, counter: 0, passwordLength: 3, key: key)
        let index = passwordFactory.getCharacterIndex()
        XCTAssertLessThan(index, 7)
    }
    
    func testValidCharacterGeneration() {
        var passwordFactory = PasswordFactory(alphabet: alphabet, counter: 50, passwordLength: 5, key: key)
        let character = passwordFactory.getCharacter()
        XCTAssert(alphabet.alphabet.contains(character))
    }
    
    func testPasswordArrayCreation() {
        var passwordFactory = PasswordFactory(alphabet: alphabet, counter: 50, passwordLength: 4, key: key)
        let passwords = passwordFactory.createPasswordArrayForCard()
        XCTAssertEqual(passwords.count, 20)
        
    }

}
