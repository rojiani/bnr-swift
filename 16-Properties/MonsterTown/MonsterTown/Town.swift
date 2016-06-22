//
//  Town.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/19/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

struct Town {
    
    // Properties
    var population = 5422
    var numberOfStoplights = 4
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    
    // IIFE - called when townSize is referenced
    // the () along with 'lazy' marking ensure that Swift will call the
    // closure & assign the result it returns to townSize when the property is acessed for 
    // the first time
    lazy var townSize: Size = {
        switch self.population {
        case 0...10000:
            return Size.Small
        
        case 10001...100000:
            return Size.Medium
        
        default:
            return Size.Large
        }
    }()
    
    // Methods
    func printTownDescription() {
        print("Population: \(population);" +
              "\n" +
              "Number of Stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
    }
    
}


