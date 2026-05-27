//
//  HomeViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 26/05/26.
//

import Foundation

final class HomeViewModel {
    
    func loadUser() -> User? {
        UserDefaultsManager.shared.loadCurrentUser()
    }
    
    func updateUserName(_ name: String?) {
        guard let name else { return }
        UserDefaultsManager.shared.updateCurrentUserName(name: name)
    }
    
    func updateUserProfileImage(data: Data?) {
        UserDefaultsManager.shared.updateCurrentUserProfileImage(data: data)
    }
    
    func logout() {
        UserDefaultsManager.shared.logout()
    }
}
