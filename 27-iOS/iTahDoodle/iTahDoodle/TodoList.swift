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

    // Override the implicit initializer in order to call loadItems()
    override init() {
        super.init()
        loadItems()
    }

    // MARK: - File Saving/Loading
    
    // computed property that gets the location where the file can be saved. Computed by a closure (IIFE)
    private let fileURL: URL = {
        let documentDirectoryURLs = FileManager.default().urlsForDirectory(.documentDirectory,
                                                                           inDomains: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return try! documentDirectoryURL.appendingPathComponent("todolist.items")
    }()

    /** Save the to-do list to a file. */
    func saveItems() {
        let itemsArray = items as NSArray

        if !itemsArray.write(to: fileURL, atomically: true) {
            print("Could not save to-do list")
        }
    }

    /** Load saved items from the todolist.items file. */
    func loadItems() {
        // Convert from NSArray to Swift array
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String] {
            items = itemsArray
        }
    }


    // MARK: - Adding/Removing To-Do Items
    
    /**
     Add a to-do item to the list. Also saves the list.
     - parameters:
        - todo: to-do item
     */
    func add(todo item: String) {
        items.append(item)
        saveItems()
    }
    
    /**
     Removes a to-do item from the list. Also saves the list.
     - paramaters:
        - index: the index of the to-do item to remove in items
     */
    func removeTodoAt(index: Int) {
        items.remove(at: index)
        saveItems()
    }

}

// MARK: UITableViewDataSource Protocol Conformance
extension TodoList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Dequeue a reusable cell with the id "Cell" & the given IndexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = items[(indexPath as NSIndexPath).row]

        // force unwrap textLabel: not all UITableViewCells are guaranteed to have a textLabel, but
        // the one you are using does
        cell.textLabel!.text = item

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // MARK: - Silver Challenge
    var getCellClass: AnyClass {
        return UITableViewCell.self
    }
    
    var getCellIdentifier: String {
        return "Cell"
    }

}
