//
//  main.swift
//  MonsterTown
//
//  Created by Navid Rojiani on 6/13/16.
//  Copyright © 2016 nkroji. All rights reserved.
//

import Foundation

/* Struct - Town */
var myTown = Town()
let ts = myTown.lazyTownSize
print(ts)

// computed properties (getter)
let computedTownSize = myTown.townSize

// lazy properties (townSize) are only calculated once.
myTown.changePopulation(1000000)
print("Size: \(myTown.lazyTownSize); population: \(myTown.population)")

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

/* For the More Curious: Type Methods */
print(Zombie.makeSpookyNoise())

print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500      // note the syntax: not fredTheZombie.victimPool(500)
print("Victim pool: \(fredTheZombie.victimPool);\n" +
       "population: \(fredTheZombie.town?.population)")
// Note that setting victimPool doesn't change the Town's population
print(myTown.population)
