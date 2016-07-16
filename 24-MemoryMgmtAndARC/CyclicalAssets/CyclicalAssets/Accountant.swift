//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by Navid Rojiani on 7/15/16.
//  Copyright © 2016 Rojiani, Navid. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> ()

    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }

    func gainedNewAsset(asset: Asset) {
        netWorth += asset.value
    }

    /* Bronze Challenge */
    func lostAsset(asset: Asset) {
        netWorth -= asset.value
    }

    deinit {
        print("\(self) is being deallocated")
    }
}
