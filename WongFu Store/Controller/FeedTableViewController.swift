//
//  FeedTableViewController.swift
//  WongFu Store
//
//  Created by Alex Wong on 8/23/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class FeedTableViewController : UITableViewController
{
    var animals: [Animal]?
    
    struct Storyboard {
        static let feedAnimalCell = "FeedAnimalCell"
        static let showAnimalDetail = "ShowAnimalDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Animal Feed"
        
        animals = Animal.fetchAnimals()
        self.tableView.reloadData()
    
        self.tableView.estimatedRowHeight = tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showAnimalDetail {
            if let animalDetailTVC = segue.destination as? AnimalDetailTableViewController {
                let selectedAnimal = self.animals?[(sender as! IndexPath).row]
                animalDetailTVC.animal = selectedAnimal
            }
        }
    }
}

// MARK - UITableViewDataSource

extension FeedTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let animals = animals {
            return animals.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.feedAnimalCell, for: indexPath) as! FeedAnimalTableViewCell
        
        cell.animal = self.animals?[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }

}


// MARK: - UITableViewDelegate

extension FeedTableViewController
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Storyboard.showAnimalDetail, sender: indexPath)
    }
}


