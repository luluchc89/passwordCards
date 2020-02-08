//
//  KeyChainTests.swift
//  passwordCardsTests
//
//  Created by Ma. de Lourdes Chaparro Candiani on 07/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import XCTest
@testable import passwordCards

class KeyChainTests: XCTestCase {


    func testSavedDataOnKeyChain() {
        let keychain = KeychainSwift()
        keychain.set("hello world", forKey: "my key")
        XCTAssertEqual("hello world", keychain.get("my key"))
        
    }
    
    func testGetDataFromKeyChain() {
        let keychain = KeychainSwift()
        XCTAssertEqual("hello world", keychain.get("my key"))
    }
    
    func testGetNonExistingKeyFromKeychain() {
        let keychain = KeychainSwift()
        XCTAssertNil(keychain.get("another key"))
    }


}
