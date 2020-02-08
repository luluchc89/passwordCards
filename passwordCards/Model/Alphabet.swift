//
//  Alphabet.swift
//  passwordCards
//
//  Created by Ma. de Lourdes Chaparro Candiani on 06/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import Foundation

struct Alphabet {
    var alphabet: String
    var characterDictionary: [Int: Character] = [:]

    init(alphabet: String, characterDictionary: [Int: Character]) {
        self.alphabet = alphabet
        self.characterDictionary = createAlphabetDictionary()
    }
    
    //Method that eliminates duplicates from alphabet
    private mutating func cleanAlphabet() {
        var set = Set<Character>()
        let clean = self.alphabet.filter{ set.insert($0).inserted }
        self.alphabet = clean
    }
    
    //Method that creates character dictionary from alphabet
    mutating func createAlphabetDictionary() -> [Int: Character] {
        cleanAlphabet()
        var alphabetDictionary:  [Int:Character] = [:]
        var index: Int = 0
        for character in alphabet {
            alphabetDictionary[index] = character
            index = index + 1
        }
        return alphabetDictionary
    }
}


