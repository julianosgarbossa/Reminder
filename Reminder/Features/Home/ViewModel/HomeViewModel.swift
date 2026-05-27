//
//  HomeViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 26/05/26.
//

import Foundation

final class HomeViewModel {
    
    func loadUser() -> User? {
        return UserDefaultsManager.shared.loadUser()
    }
    
    func updateUserName(_ name: String?) {
        guard let name else { return }
        UserDefaultsManager.shared.updateUserName(name: name)
    }
    
    func updateUserProfileImage(data: Data?) {
        UserDefaultsManager.shared.updateUserProfileImage(data: data)
    }
    
    func logout() {
        UserDefaultsManager.shared.removeUser()
    }
}
