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
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)

/* Silver Challenge */
let dracula = Vampire()
let nosferatu = Vampire()
dracula.town = myTown
nosferatu.town = myTown
dracula.changeName("Dracula")
nosferatu.changeName("Nosferatu")
dracula.terrorizeTown()
dracula.town?.printTownDescription()
dracula.printVampireThralls()
nosferatu.terrorizeTown()
nosferatu.town?.printTownDescription()
nosferatu.printVampireThralls()

print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}

print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500      // note the syntax: not fredTheZombie.victimPool(500)
print("Victim pool: \(fredTheZombie.victimPool)")



