//
//  Zombie.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/19/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

// Zombie is a Subclass of Monster
class Zombie: Monster {
    
    /* Properties */
    // Stored Properties
    var walksWithLimp = true
    
    // Computed Properties
    // get: internal; set: private
    private(set) var isFallingApart = false
    
    // Since this does not take any arguments, it is a good candidate for a computed property
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    /* Methods */
    final override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(-10)
        }
        super.terrorizeTown()
    }
    
    func changeName(_ name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }

    
}
