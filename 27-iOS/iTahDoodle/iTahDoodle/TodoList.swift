//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Navid Rojiani on 7/27/16.
//  Copyright © 2016 Navid Rojiani. All rights reserved.
//

import UIKit

class TodoList: NSObject {

    private var items: [String] = []

    func addItem(item: String) {
        items.append(item)
    }

}
