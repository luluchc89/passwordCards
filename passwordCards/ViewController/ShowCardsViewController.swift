//
//  ShowCardsViewController.swift
//  passwordCards
//
//  Created by Ma. de Lourdes Chaparro Candiani on 08/02/20.
//  Copyright © 2020 sgh. All rights reserved.
//

import UIKit

class ShowCardsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var passwordSetsArray: [[String]]?
    

    @IBOutlet weak var cardsCollection: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsCollection.dataSource = self
        cardsCollection.delegate = self
        let nib = UINib(nibName: String(describing: CardCollectionViewCell.self), bundle: nil)
        cardsCollection.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return passwordSetsArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardsCollection.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        guard let passwords = self.passwordSetsArray else { return cell }
        cell.passwords = passwords[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height-30)
    }
    

}
