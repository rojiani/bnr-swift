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

    let todoList = TodoList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // tells the table view what to do when the data source tries to dequeue a reusable cell
        // with the identifier "Cell”
        // specifically, it registers the class UITableViewCell, which tells the table view to
        // create instances of UITableViewCell
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // tells the table view that the todoList is its data source
        tableView.dataSource = todoList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: UIButton) {
        guard let text = itemTextField.text else {
            return
        }
        todoList.addItem(text)
        tableView.reloadData()
        itemTextField.text = ""
    }

}
