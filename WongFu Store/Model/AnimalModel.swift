//
//  AnimalModel.swift
//  WongFu Store
//
//  Created by Alex Wong on 8/23/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import Foundation
import UIKit

class Animal
{
    var uid: String?
    var name: String?
    var images: [UIImage]?
    var price: Double?
    var description: String?
    var detail: String?
    
    init(uid: String, name: String, images: [UIImage], price: Double, description: String, detail: String)
    {
        self.uid = uid
        self.name = name
        self.images = images
        self.price = price
        self.description = description
        self.detail = detail
    }
    
    class func fetchAnimals() -> [Animal]
    {
        var animals = [Animal]()
        
        // 1
        var animal1Images = [UIImage]()
        for i in 1...8 {
            animal1Images.append(UIImage(named: "s\(i)")!)
        }
        let animal1 = Animal(uid: "875942-100", name: "AWKWARD PANDA", images: animal1Images, price: 25, description: "Clumsy. Embarrassing. Awkward. No matter who you are, everyone’s had those moments. And it’s times like those when we need someone the most. Well, you’re in luck! Have no fear– Awkward Panda will save the day! Well…as soon as he can stand on his own two feet anyway. Yea…it could take awhile.", detail: "LAwkward Panda– guaranteed to rescue you from those everyday embarrassments and/or make things all the more awkward. Results may vary...hey, at least he's super cute!")
        animals.append(animal1)
        
        // 2
        var animal2Images = [UIImage]()
        for i in 1...7 {
            animal2Images.append(UIImage(named: "t\(i)")!)
        }
        let animal2 = Animal(uid: "880843-003", name: "AWKWARD TURTLE", images: animal2Images, price: 25, description: "Clumsy. Embarrassing. Awkward. No matter who you are, everyone’s had those moments. And it’s times like those when we need someone the most. Well, you’re in luck! Have no fear– Awkward Turtle will save the day! Well…as soon as he get’s himself up. Yea…it could take awhile.", detail: "Awkward Turtle– guaranteed to rescue you from those everyday embarrassments and/or make things all the more awkward. Results may vary. Turtle Power!")
        animals.append(animal2)
        
        
        // 3
        var animal3Images = [UIImage]()
        for i in 1...6 {
            animal3Images.append(UIImage(named: "j\(i)")!)
        }
        let animal3 = Animal(uid: "384664-113", name: "AWKWARD BUNNY", images: animal3Images, price: 25, description: "Clumsy. Embarrassing. Awkward. No matter who you are, everyone’s had those moments. And it’s times like those when we need someone the most. Well, you’re in luck! Have no fear– Awkward Bunny will save the day! Well…as soon as she can figure out how to hop around on those two left feet. Yea…it could take awhile. ", detail: "Awkward Bunny– guaranteed to rescue you from those everyday embarrassments and/or make things all the more awkward. Results may vary...and did we mention she  doesn't really like carrots?")
        animals.append(animal3)
        
        // 4
        var animal4Images = [UIImage]()
        for i in 1...6 {
            animal4Images.append(UIImage(named: "f\(i)")!)
        }
        let animal4 = Animal(uid: "805144-852", name: "AWKWARD COW", images: animal4Images, price: 25, description: "Clumsy. Embarrassing. Awkward. No matter who you are, everyone’s had those moments. And it’s times like those when we need someone the most. Well, you’re in luck! Have no fear– Awkward Cow will save the day! Well… as soon as she can waddle her way over. ", detail: "Awkward Cow – guaranteed to rescue you from those everyday embarrassments and/or make things all the more awkward. Results may vary...")
        animals.append(animal4)
        
        return animals
    }
}
