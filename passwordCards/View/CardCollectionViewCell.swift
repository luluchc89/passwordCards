//
//  CardCollectionViewCell.swift
//  passwordCards
//
//  Created by Ma. de Lourdes Chaparro Candiani on 07/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "cardCell"
    
    public var passwords: [String]? {
        didSet {
            updatePasswordsData()
        }
    }
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    
    func updatePasswordsData() {
        var passwordIndex = 0
        for i in 1...5 {
            for j in 1...4 {
                let horizontalStack = stackView.arrangedSubviews[i] as! UIStackView
                let passwordLabel = horizontalStack.arrangedSubviews[j] as! UILabel
                passwordLabel.text = passwords?[passwordIndex]
              passwordIndex = passwordIndex + 1
            }
        }
    }
    

}
