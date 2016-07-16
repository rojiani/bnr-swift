//
//  Asset.swift
//  CyclicalAssets
//
//  Created by Rojiani, Navid on 7/15/16.
//  Copyright © 2016 Rojiani, Navid. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    // NOTE: weak references must declared with:
    //       1. var
    //       2. ?
    weak var owner: Person?

    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name), worth \(value), owned by \(actualOwner))"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone)"
        }
    }

    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }

    deinit {
        print("\(self) is being deallocated")
    }

}

/* Bronze Challenge */
extension Asset: Equatable {}
func ==(lhs: Asset, rhs: Asset) -> Bool {
    return (lhs.name == rhs.name) && (lhs.value == rhs.value)
}
