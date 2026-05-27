//
//  SplashViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 27/05/26.
//

import Foundation

final class SplashViewModel {
    var hasLoggedUser: Bool {
        UserDefaultsManager.shared.loadCurrentUser() != nil
    }
}
