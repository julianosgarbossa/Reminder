//
//  LoginDelegate.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 15/01/25.
//

import UIKit

protocol LoginDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
