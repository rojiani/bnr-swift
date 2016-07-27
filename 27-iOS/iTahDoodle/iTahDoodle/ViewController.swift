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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: UIButton) {
        print("Add to-do item: \(itemTextField.text)")
    }

}
