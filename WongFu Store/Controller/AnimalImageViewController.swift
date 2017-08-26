//
//  AnimalImageViewController.swift
//  WongFu Store
//
//  Created by Alex Wong on 8/26/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class AnimalImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        
        didSet{
            
            self.imageView?.image = image
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageView.image = image
    }

}
