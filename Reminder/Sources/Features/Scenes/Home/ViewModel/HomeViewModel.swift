//
//  HomeViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 23/01/25.
//

import Foundation

class HomeViewModel {
    
    func logoutUser() {
        UserDefaultMenager.removeUser()
    }
}
