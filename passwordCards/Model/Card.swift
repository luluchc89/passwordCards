//
//  Card.swift
//  passwordCards
//
//  Created by Ma. de Lourdes Chaparro Candiani on 06/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import Foundation

struct Card {
    let columns = ["A", "B", "C", "D"]
    let rows = [1,2,3,4,5]
    var passwords: [String]
    
    init(passwords: [String]) {
        self.passwords = passwords
    }
    
}
