//
//  MyRecipeFlowDelegate.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 19/02/25.
//

import Foundation

public protocol MyRecipeFlowDelegate: AnyObject {
    func goToNewRecipe()
    func popScreen()
}
