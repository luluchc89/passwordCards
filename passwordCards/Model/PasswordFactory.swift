//
//  PasswordFactory.swift
//  passwordCards
//
//  Created by Ma. de Lourdes Chaparro Candiani on 06/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import Foundation
import CryptoKit

struct PasswordFactory {
    
    var alphabet: Alphabet
    var counter: UInt128
    var passwordLength: Int
    var key: Key

    
    mutating func createPasswordArrayForCard() -> [String] {
        var passwords: [String] = []
        for _ in 1...20 {
            passwords.append(createPassword(length: passwordLength))
        }
        return passwords
    }
    
    //Method that creates a new password
    mutating func createPassword(length: Int) -> String {
        var password: String = ""
        for _ in 1...length {
            password.append(getCharacter())
        }
        return password
    }

   //Method that returns a character for a new password
    mutating func getCharacter() -> Character {
        let index = getCharacterIndex()
        let chara = alphabet.characterDictionary[Int(index)]
        return chara!
    }

    //Method that calculates the dictionary index of the character
    mutating func getCharacterIndex() -> UInt128 {
           let dataCounter: Data = withUnsafeBytes(of: counter) { Data($0)}
        let sealedBox = try! AES.GCM.seal(dataCounter, using: key.swiftKey!)
           let cipheredInt = sealedBox.ciphertext.withUnsafeBytes {$0.bindMemory(to: UInt128.self)[0]}
           self.counter = self.counter + 1
           return (cipheredInt%UInt128(self.alphabet.alphabet.count))
    }
    
}
