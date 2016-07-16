//
//  Person.swift
//  CyclicalAssets
//
//  Created by Rojiani, Navid on 7/15/16.
//  Copyright © 2016 Rojiani, Navid. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {

    let name: String

    var description: String {
        return "Person(\(name))"
    }

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(self) is being deallocated")
    }
}



