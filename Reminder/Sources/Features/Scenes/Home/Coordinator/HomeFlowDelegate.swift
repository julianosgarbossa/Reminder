//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 23/01/25.
//

import Foundation

public protocol HomeFlowDelegate: AnyObject {
    func navigateToMyRecipe()
    func navigateToNewRecipe()
    func logout()
}
