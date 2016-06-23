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
    
    // Type Methods - Ch. 15 - For the More Curious
    // For Value Types (structs, enums), use "static" keyword
    // For classes, you use "class" keyword
    // oddly, for type properties, you use "static" for both structs & classes
    // See Ch. 16 for type properties
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
    
    // Properties
    var walksWithLimp = true
    
    // Methods
    // override func terrorizeTown() {          // override superclass' terrorizeTown()
    final override func terrorizeTown() {       // final: prevent subclasses of Zombie from overriding
        if (town?.population <= 10) {
            town?.population = 0
        } else {
            town?.changePopulation(-10)     // see book note - optional binding & optional chaining
        }
        super.terrorizeTown()
    }
    
    func changeName(_ name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }

    
}
