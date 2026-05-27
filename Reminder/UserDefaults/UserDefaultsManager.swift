//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 22/05/26.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private let userDefaults = UserDefaults.standard
    private let userKey = "userKey"
    
    private init() {}
    
    func save(user: User) {
        do {
            let data = try JSONEncoder().encode(user)
            userDefaults.set(data, forKey: userKey)
        } catch {
            print("Falha ao fazer codificação do usuário:", error)
        }
    }
    
    func loadUser() -> User? {
        guard let data = userDefaults.data(forKey: userKey) else { return nil }
        
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            return user
        } catch {
            print("Falha ao fazer decodificação do usuário:", error)
            return nil
        }
    }
    
    func updateUserName(name: String) {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard var user = loadUser(), !trimmedName.isEmpty else {
            return
        }
        
        user.name = trimmedName
        save(user: user)
    }
    
    func updateUserProfileImage(data: Data?) {
        guard var user = loadUser() else {
            return
        }

        user.profileImageData = data
        save(user: user)
    }
    
    func removeUser() {
        userDefaults.removeObject(forKey: userKey)
    }
    

}
