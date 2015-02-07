//
//  LionCup.swift
//  LionsAndTigers
//
//  Created by Diego Perez on 2/6/15.
//  Copyright (c) 2015 Diego Perez. All rights reserved.
//

import Foundation

class LionCup: Lion {
    
    func rubLionCupBelly(){
        println("LionCup: Snuggle and be happy")
    }
    
    override func roar() {
        super.roar()
        println("LionCup: growl growl")
    }
}