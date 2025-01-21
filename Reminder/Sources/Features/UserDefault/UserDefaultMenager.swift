//
//  UserDefaultMenager.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/01/25.
//

import Foundation

class UserDefaultMenager {
    private static let userKey = "app_userKey"
    
    static func saveUser(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func loadUser() -> User? {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: userData) {
                return user
            }
        }
        return nil
    }
}
