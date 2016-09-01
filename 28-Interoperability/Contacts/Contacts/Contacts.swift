//
//  Contacts.swift
//  Contacts
//
//  Created by Navid Rojiani on 8/26/16.
//  Copyright © 2016 Navid Rojiani. All rights reserved.
//

import Foundation

@objc class Contact: NSObject {
    let name: String

    init(contactName: String) {
        name = contactName
    }

}
