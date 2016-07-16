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

bob = nil   // deinit called
print("the bob variable is now \(bob)")

