//
//  ContactModel.swift
//  ContactCRUDApp
//
//  Created by Muhammad Rajab Priharsanto on 20/05/20.
//  Copyright © 2020 Muhammad Rajab Priharsanto. All rights reserved.
//

import Foundation

struct ContactDetail: Decodable
{
    let id: String
    let firstName: String
    let lastName: String
    let age: Int
    let photo: String
}

struct ContactResponse: Decodable
{
    var data: [ContactDetail]
}
