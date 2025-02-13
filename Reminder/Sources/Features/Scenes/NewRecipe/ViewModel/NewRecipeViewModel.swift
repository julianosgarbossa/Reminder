//
//  NewRecipeViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 13/02/25.
//

import Foundation

class NewRecipeViewModel {
    func addRecipe(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        DBHelper.shared.insertRecipe(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    }
}
