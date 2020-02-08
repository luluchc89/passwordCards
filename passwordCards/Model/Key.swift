//
//  Key.swift
//  passwordCards
//
//  Created by Ma. de Lourdes Chaparro Candiani on 07/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import Foundation
import CryptoKit

struct Key {
    var swiftKey: SymmetricKey?
    
    init(keyString: String) {
        self.swiftKey = SymmetricKey(data: Data(base64Encoded: keyString)!)
    }
    
    init() {
        self.swiftKey = SymmetricKey(size: .bits256)
    }
    
    mutating func generateNewKey() {
        self.swiftKey = SymmetricKey(size: .bits256)
    }
    
    func getKeyString() -> String {
        let keyb64 = swiftKey!.withUnsafeBytes {
                   return Data(Array($0)).base64EncodedString()
               }
        return keyb64
    }
}
