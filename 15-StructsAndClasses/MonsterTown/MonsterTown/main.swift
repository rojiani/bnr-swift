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
myTown.changePopulation(500)
myTown.printTownDescription()

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
