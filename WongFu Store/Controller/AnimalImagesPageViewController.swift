//
//  AnimalImagesPageViewController.swift
//  WongFu Store
//
//  Created by Alex Wong on 8/26/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

protocol AnimalImagesPageViewControllerDelegate: class {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class AnimalImagesPageViewController: UIPageViewController {

    var images: [UIImage]? = Animal.fetchAnimals().first!.images
    
    struct Storyboard{
        
        static let animalImageViewController = "AnimalImageViewController"
        
    }
    
    weak var pageViewControllerDelegate: AnimalImagesPageViewControllerDelegate?
    
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.images {
            
            for image in images {
                
                let animalImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.animalImageViewController)
                controllers.append(animalImageVC)
                
                
            }
            
        }
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        return controllers
        
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        self.turnToPage(index: 0)
        
    }
    
    func turnToPage(index: Int){
        
        let controller = controllers[index]
        
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first{
            
            let currentIndex = controllers.index(of: currentVC)
            
            if currentIndex! > index {
                
                direction = .reverse
            }
            
            
        }
        
        self.configureDisplaying(viewController: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
        
        
    }
    
    func configureDisplaying(viewController: UIViewController){
        
        for (index, vc) in controllers.enumerated(){
            
            if viewController === vc {
                
                if let animalImageVC = viewController as? AnimalImageViewController{
                    
                    animalImageVC.image = self.images?[index]
                    
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                    
                }
                
                
            }
            
            
        }
        
        
    }
}

// MARK: - UIPageViewControllerDataSource

extension AnimalImagesPageViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController){
            
            if index > 0 {
                
                return controllers[index-1]
                
                
            }
            
            
        }
        
        return controllers.last
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController){
            
            if index < controllers.count - 1 {
                
                return controllers[index + 1]
                
                
            }
            
        }
        
        
        return controllers.first
        
    }
}

extension AnimalImagesPageViewController: UIPageViewControllerDelegate{
    
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! AnimalImageViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed{
            
            self.configureDisplaying(viewController: previousViewControllers.first as! AnimalImageViewController)
            
            
        }
    }
    
    
    
    
    
    
    
    
}
