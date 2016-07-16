//
//  main.swift
//  CyclicalAssets
//
//  Created by Rojiani, Navid on 7/15/16.
//  Copyright © 2016 Rojiani, Navid. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")  // strong reference (by default)
print("created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

bob?.takeOwnershipOfAsset(laptop!)
bob?.takeOwnershipOfAsset(hat!)

/* Silver Challenge */
var ned: Person? = Person(name: "Ned")
print("Bob's assets:", bob!.assets)
print("Ned's assets:", ned!.assets)

bob?.relinquishOwnershipOfAsset(hat!)
bob?.relinquishOwnershipOfAsset(laptop!)

ned?.takeOwnershipOfAsset(hat!)
print("Ned's assets:", ned!.assets)

print("While Bob is alive, hat's owner is \(hat!.owner)")
bob = nil
print("the bob variable is now \(bob)")
print("After Bob is deallocated, hat's owner is \(hat!.owner)")

laptop = nil
hat = nil
backpack = nil
