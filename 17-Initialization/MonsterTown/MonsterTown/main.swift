//
//  main.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/13/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

/* Struct - Town */
// using default memberwise initializer (if no initializers explicitly defined)
//var myTown = Town(region: "South", population: 10000, numberOfStoplights: 6)
// with defined initializer
//var myTown = Town(region: "South", population: 10000, stoplights: 6)
// using initializer delegation
var myTown = Town(population: 10000, stoplights: 6)
myTown.printTownDescription()

// computed properties (getter)
let computedTownSize = myTown.townSize

myTown.changePopulation(1000000)

// computed property will reflect change
print("Size: \(myTown.townSize); population: \(myTown.population)")

/* Class - Monster */
var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.town = myTown
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printTownDescription()
fredTheZombie?.changeName("Fred the Zombie", walksWithLimp: false)

let convenientZombie = Zombie(limp: true, fallingApart: false)

print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}

print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500      // note the syntax: not fredTheZombie.victimPool(500)
print("Victim pool: \(fredTheZombie?.victimPool)")

fredTheZombie = nil // triggers message in deinitializer

