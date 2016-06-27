//
//  Monster.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/19/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

class Monster {

    static let isTerrifying = true

    // computed type properties can use 'class' instead of 'static' to permit subclasses
    // to override them
    class var spookyNoise: String {
        return "Grrr"
    }

    // Properties
    var town: Town?
    var name = "Monster"
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
        // set {
            // if no name provided, can use Swift default 'newValue'
            town?.population = newVictimPool
            // town?.population = newValue
        }
    }

    // Methods

    static func sayFoobar() { print("foobar static method") }

    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
