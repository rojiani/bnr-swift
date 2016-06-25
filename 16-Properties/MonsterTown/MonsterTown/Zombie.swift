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
    // class func makeSpookyNoise() -> String {
    //    return "Brains..."
    //}
    // Since this does not take any arguments, it is a good candidate for a computed property
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    // Properties
    var walksWithLimp = true
    // private var isFallingApart = false
    // if property has both getter & setter, can change their visibility separately
    // internal getter, private setter:
    // internal private(set) var isFallingApart = false
    // don't need to state internal, since it is the default. 
    private(set) var isFallingApart = false
    

    // Methods
    // override func terrorizeTown() {          // override superclass' terrorizeTown()
    final override func terrorizeTown() {       // final: prevent subclasses of Zombie from overriding
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
