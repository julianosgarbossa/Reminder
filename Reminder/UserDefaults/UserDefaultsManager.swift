//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 22/05/26.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private let userKey = "userKey"
    
    func save(user: User) {
        do {
            let data = try JSONEncoder().encode(user)
            UserDefaults.standard.set(data, forKey: userKey)
        } catch {
            print("Falha ao fazer codificação do usuário:", error)
        }
    }
    
    func loadUser() -> User? {
        if let data = UserDefaults.standard.data(forKey: userKey) {
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                return user
            } catch {
                print("Falha ao fazer decodificação do usuário:", error)
            }
        }
        return nil
    }
    
    func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
    }
}
