//
//  User.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 22/05/26.
//

import Foundation

struct User: Codable {
    let email: String
    var name: String?
    let isUserSaved: Bool
}
