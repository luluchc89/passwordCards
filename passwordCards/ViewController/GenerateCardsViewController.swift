//
//  GenerateCardsViewController.swift
//  passwordCards
//
//  Created by Ma. de Lourdes Chaparro Candiani on 1/27/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import UIKit

class GenerateCardsViewController: UIViewController {
    
    var key: Key?
    var passwordSets: [[String]] = []
    
    @IBOutlet weak var ketTitleLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var alphabetTextView: UITextView!
    @IBOutlet weak var passwordLengthLabel: UILabel!
    @IBOutlet weak var passwordLengthStepper: UIStepper!
    @IBOutlet weak var numberOfCardsLabel: UILabel!
    @IBOutlet weak var numberOfCardsStepper: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure passwordLengthStepper
        passwordLengthStepper.minimumValue = 1.0
        passwordLengthStepper.maximumValue = 6.0
        passwordLengthStepper.stepValue = 1.0
        passwordLengthStepper.value = 1.0
        
        //Configure numberOfCardsStepper
        numberOfCardsStepper.minimumValue = 1.0
        numberOfCardsStepper.maximumValue = 10.0
        numberOfCardsStepper.stepValue = 1.0
        numberOfCardsStepper.value = 1.0
        
        let keychain = KeychainSwift()
        let keyString = keychain.get("key")
        if(keyString != nil) {
            key = Key(keyString: keyString!)
            keyLabel.text = keyString
        } else {
            key = Key()
            keyLabel.text = key!.getKeyString()
        }
        
    }

    @IBAction func getNewKey(_ sender: UIButton) {
        self.key!.generateNewKey()
        let keyString = self.key!.getKeyString()
        keyLabel.text = keyString
        let keychain = KeychainSwift()
        keychain.set(keyString, forKey: "key")
    }
    
    @IBAction func changeLength(_ sender: UIStepper) {
        passwordLengthLabel.text = String(Int(passwordLengthStepper.value))
    }
    
    
    @IBAction func changeNumberOfCards(_ sender: UIStepper) {
        numberOfCardsLabel.text =  String(Int(numberOfCardsStepper.value))
    }
    
    
    
    @IBAction func generateCards(_ sender: UIButton) {
        let alphabet = Alphabet(alphabet: (alphabetTextView?.text)!, characterDictionary: [:])
        var factory = PasswordFactory(alphabet: alphabet, counter: 0, passwordLength: Int(passwordLengthStepper.value), key: key!)
        var passwordsSets: [[String]] = []
        for _ in 1...Int(numberOfCardsStepper.value) {
            passwordsSets.append(factory.createPasswordArrayForCard())
        }
        self.passwordSets = passwordsSets
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCards"{
            let showCardsView = segue.destination as! ShowCardsViewController
            showCardsView.passwordSetsArray = self.passwordSets
        }
    }
    
    
    
}

