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
    let accountant = Accountant()
    var assets = [Asset]()

    var description: String {
        return "Person(\(name))"
    }

    init(name: String) {
        self.name = name

        /* "By default, a closure takes a strong reference to any variables
            that it uses inside the scope */
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in

            // This will give Accountant.netWorthChangedHandler a strong
            // reference to Person ('self')
            self?.netWorthDidChange(netWorth)
            return
        }
    }

    deinit {
        print("\(self) is being deallocated")
    }

    func takeOwnershipOfAsset(asset: Asset) {
        guard (asset.owner == nil) else {
            return
        }

        asset.owner = self
        assets.append(asset)
        accountant.gainedNewAsset(asset)
    }

    func relinquishOwnershipOfAsset(asset: Asset) {
        removeAsset(asset)
        asset.owner = nil
        accountant.lostAsset(asset)
    }

    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }

    private func removeAsset(asset: Asset) {
        assets = assets.filter { $0 != asset }
    }

}
