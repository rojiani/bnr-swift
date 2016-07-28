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

extension TodoList: UITableViewDataSource {

    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Dequeue a reusable cell with the id "Cell" & the given IndexPath
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let item = items[indexPath.row]

        // force unwrap textLabel: not all UITableViewCells are guaranteed to have a textLabel, but
        // the one you are using does
        cell.textLabel!.text = item

        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // one row for each to-do item
        return items.count
    }

}
