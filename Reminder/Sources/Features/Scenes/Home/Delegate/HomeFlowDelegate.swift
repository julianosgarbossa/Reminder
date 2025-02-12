//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 23/01/25.
//

import Foundation

public protocol HomeFlowDelegate: AnyObject {
    func navigateToRecipes()
    func logout()
}
