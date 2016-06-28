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
    var name: String!

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
    // Designated Initializer
    // 'required' - require all subclasses to provide this initializer
    required init?(town: Town?, monsterName: String) {
        if monsterName == "" {
            self.name = nil
            return nil
        }
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
