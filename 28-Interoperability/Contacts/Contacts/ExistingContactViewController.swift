//
//  ExistingContactViewController.swift
//  Contacts
//
//  Created by Navid Rojiani on 8/31/16.
//  Copyright © 2016 Navid Rojiani. All rights reserved.
//

import UIKit

class ExistingContactViewController: UIViewController {

    var contact: Contact? {
        didSet {
            setTitle()
        }
    }

    var editingMode: Bool = false

    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        setTitle()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func editButtonPressed() {
        toggleEditingMode()
    }

    // MARK: UI
    /* Set the title to be the existing contact's name */
    func setTitle() {
        if let contact = self.contact {
            name?.text = contact.name
        } else {
            name?.text = ""
        }
    }

    func toggleEditingMode() {
        self.editingMode = !self.editingMode
        updateUI()
    }

    private func updateUI() {
        if self.editingMode {
            self.firstNameTextField.hidden = false
            self.lastNameTextField.hidden = false
            self.firstNameLabel.hidden = false
            self.lastNameLabel.hidden = false

            self.editButton.enabled = false
            self.saveButton.enabled = true

        } else {
            self.firstNameTextField.hidden = true
            self.lastNameTextField.hidden = true
            self.firstNameLabel.hidden = true
            self.lastNameLabel.hidden = true

            self.editButton.enabled = true
            self.saveButton.enabled = false
        }
    }


}
