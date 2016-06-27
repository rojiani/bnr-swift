//
//  Vampire.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/19/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

class Vampire : Monster {
    
    static var vampireThralls = [Vampire]()
    
    override func terrorizeTown() {
        if (town?.population > 1) {
            town?.changePopulation(-1)
        }
        Vampire.vampireThralls.append(self)
        super.terrorizeTown()
    }
    
    func changeName(_ name: String) {
        self.name = name
    }
    
    func printVampireThralls() -> () {
        print("Vampire Thralls:")
        for vampire in Vampire.vampireThralls {
            print(vampire.name)
        }
    }
}
