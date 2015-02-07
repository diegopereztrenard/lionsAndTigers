//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Diego Perez on 2/4/15.
//  Copyright (c) 2015 Diego Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var lions:[Lion] = []
    
    var myTigers:[Tiger] = []
    
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed =  "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "bengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: false)
        
        myTigers.append(myTiger)
        
        println("My Tiger's name is : \(myTiger.name), its' age is: \(myTiger.age), its' breed is: \(myTiger.breed) and its' image is: \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        
        self.randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "indochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        myTiger.chuffANumberOfTimes(3)
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        lion.changeToAlphaMale()
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        self.lions += [lion, lioness]
        
        var lionCup = LionCup()
        lionCup.age = 1
        lionCup.name = "Simba"
        lionCup.image = UIImage(named: "Lioncup1.jpg")
        lionCup.subspecies = "Masal"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateAnimal() {
        switch currentAnimal{
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView() {
    
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            if self.currentAnimal.species == "Tiger"{
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
                
            }
            else if self.currentAnimal.species == "Lion"{
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFact()
                
            }
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }

    @IBAction func nextBarButtonItemPress(sender: UIBarButtonItem) {
        
        updateAnimal()
        updateView()
   
    }
    
    func updateTiger() {
    
        var randomIndex:Int
        do{
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        }while currentIndex == randomIndex
        
        currentIndex = randomIndex
        
        let tiger = myTigers[randomIndex]
        
        //        myImageView.image = tiger.image
        //        nameLabel.text = tiger.name
        //        ageLabel.text = "\(tiger.age)"
        //        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }

}

