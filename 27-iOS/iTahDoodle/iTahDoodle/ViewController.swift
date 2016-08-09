//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Navid Rojiani on 7/26/16.
//  Copyright © 2016 Navid Rojiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var removalModeActive = false

    let todoList = TodoList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tells the table view what to do when the data source tries to dequeue a reusable cell with the identifier
        // "Cell” - specifically, it registers the class UITableViewCell, which tells the table view to create 
        // instances of UITableViewCell
        tableView.register(todoList.getCellClass, forCellReuseIdentifier: todoList.getCellIdentifier)
        
        // tells the table view that the todoList is its data source
        tableView.dataSource = todoList
        
        // Set delegate
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Button Handlers
    @IBAction func addButtonPressed(_ sender: UIButton) {
        removalModeActive = false
        addTodoToTableView()
    }
    
    @IBAction func removeButtonPressed(_ sender: UIButton) {
        toggleRemovalMode()
    }
    
    private func toggleRemovalMode() {
        removalModeActive = !removalModeActive
    }
    
    // MARK: Add or Remove from TableView
    private func addTodoToTableView() {
        guard let text = itemTextField.text where text != "" else {
            return
        }
        todoList.add(todo: text)
        tableView.reloadData()
        itemTextField.text = ""
    }
    
    private func removeTodoFromTableView(atIndexPath indexPath: IndexPath) {
        guard removalModeActive else {
            return
        }
        todoList.removeTodoAt(index: indexPath.row)
        tableView.reloadData()
    }
    


}

// MARK: - UITableViewDelegate Protocol Conformance
extension ViewController: UITableViewDelegate {

    // MARK: - Gold Challenge
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        removeTodoFromTableView(atIndexPath: indexPath)
    }
}
