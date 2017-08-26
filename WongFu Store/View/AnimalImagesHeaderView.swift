//
//  AnimalImagesHeaderViewController.swift
//  WongFu Store
//
//  Created by Alex Wong on 8/26/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class AnimalImagesHeaderView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension AnimalImagesHeaderView: AnimalImagesPageViewControllerDelegate{


    func setupPageController(numberOfPages: Int){

    pageControl.numberOfPages = numberOfPages

    }

    func turnPageController(to index: Int){

        pageControl.currentPage = index


    }

}

