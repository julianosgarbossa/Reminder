//
//  HomeViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 26/05/26.
//

import Foundation

final class HomeViewModel {
    
    func loadUserName() -> String? {
        return UserDefaultsManager.shared.loadUser()?.name
    }
    
    func updateUserName(_ name: String?) {
        guard let name else { return }
        UserDefaultsManager.shared.updateUserName(name: name)
    }
    
    func logout() {
        UserDefaultsManager.shared.removeUser()
    }
}
