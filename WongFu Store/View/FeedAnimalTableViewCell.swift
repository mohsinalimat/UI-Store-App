//
//  FeedAnimalTableViewCell.swift
//  WongFu Store
//
//  Created by Alex Wong on 8/23/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class FeedAnimalTableViewCell : UITableViewCell{
    
    
    @IBOutlet weak var animalPriceLabel: UILabel!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!
    
    var animal: Animal! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        animalImageView.image = animal.images?.first
        animalNameLabel.text = animal.name
        if let price = animal.price {
            animalPriceLabel.text = "$\(price)0"
        } else {
            animalPriceLabel.text = ""
        }
    }
}
