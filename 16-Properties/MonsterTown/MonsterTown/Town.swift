//
//  Town.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/19/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

struct Town {
    
    /* Properties */
    static let region = "South"
    
    // Stored properties
    var population = 5422 {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
    
    var numberOfStoplights = 4
    // could also have a constant (let) stored property
    
    enum Size {
        case small
        case medium
        case large
    }
    
    // lazy initialized stored property
    // IIFE - called when townSize is referenced
    // the () along with 'lazy' marking ensure that Swift will call the
    // closure & assign the result it returns to townSize when the property is acessed for 
    // the first time
    // A closure (& lazy) works well here since the value of the town's population is needed
    // in order to determine the town's size
    // Must be lazy - 'self' unresolved if not
    lazy var lazyTownSize: Size = {
        switch self.population {
        case 0...10000:
            return Size.small
        
        case 10001...100000:
            return Size.medium
        
        default:
            return Size.large
        }
    }()
    
    // Computed properties
    // a read-only computed property (no setter)
    // note: if no setter, can leave out get { ... }
    var townSize: Size {
        get {
            switch self.population {
                case 0...10000:
                    return Size.small
                
                case 10001...100000:
                    return Size.medium

                default:
                    return Size.large
            }
        }
    }
    
    
    
    // Methods
    func printTownDescription() {
        print("Population: \(population);" +
              "\n" +
              "Number of Stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(_ amount: Int) {
        population += amount
    }
    
}


