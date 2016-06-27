//
//  Monster.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/19/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

class Monster {
    
    /* Properties */
    
    // Type Properties
    static let isTerrifying = true

    class var spookyNoise: String {
        return "Grrr"
    }

    // Stored Properties
    var town: Town?
    var name: String
    
    // Computed Properties
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }

    /* Initializers */
    init(town: Town?, monsterName: String) {
        self.town = town
        name = monsterName
    }
    
    /* Methods & Functions */
    
    // Type Functions
    static func sayFoobar() { print("foobar static method") }

    // Methods
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
