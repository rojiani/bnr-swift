//
//  Mayor.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/24/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

struct Mayor {
    
    private var anxietyLevel: Int = 0
    
    
    // Silver Challenge
    mutating func respondToPopulationChange(change: Int) -> () {
        if change < 0 {
            print("I'm deeply saddened to hear about this latest tragedy. I promise that my " +
                  "office is looking into the nature of this rash of violence.")
            anxietyLevel += 1
        }
    }
    
}