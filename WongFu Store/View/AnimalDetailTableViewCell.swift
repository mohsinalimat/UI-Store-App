//
//  AnimalDetailTableViewCell.swift
//  WongFu Store
//
//  Created by Alex Wong on 8/23/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class AnimalDetailCell: UITableViewCell {

    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalDescriptionLabel: UILabel!

    
    var animal: Animal! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        animalNameLabel.text = animal.name
        animalDescriptionLabel.text = animal.description
    }

}
