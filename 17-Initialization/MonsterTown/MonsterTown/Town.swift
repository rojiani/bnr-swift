//
//  Town.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/19/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

struct Town {

    /* Nested Types */
    enum Size {
        case small
        case medium
        case large
    }
    
    /* Properties */
    let region: String
    
    // Stored properties
    var population: Int {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has decreased from \(oldPopulation) to \(population).")
            }
        }
    }
    
    var numberOfStoplights: Int

    // Computed properties
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

    /* Initializers */
    // Memberwise initializer
    // Takes a parameter for each *stored* property (but not computed properties)
    init(region: String, population: Int, stoplights: Int) {
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }
    
    /* Methods */
    func printTownDescription() {
        print("Population: \(population);" +
              "\n" +
              "Number of Stoplights: \(numberOfStoplights)" +
              "\n" +
              "Region: \(region)")
    }
    
    mutating func changePopulation(_ amount: Int) {
        population += amount
    }
    
}


