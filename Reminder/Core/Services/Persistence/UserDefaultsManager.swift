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
    private let currentUserIDKey = "currentUserID"
    
    private init() {}
    
    private func userKey(for id: String) -> String {
        "user_\(id)"
    }
    
    func login(user: User) {
        if loadUser(id: user.id) == nil {
            save(user: user)
        }
        SessionManager.shared.startSession(userID: user.id)
        userDefaults.set(user.id, forKey: currentUserIDKey)
    }
    
    func loginTemporarily(user: User) {
        if loadUser(id: user.id) == nil {
            save(user: user)
        }
        SessionManager.shared.startSession(userID: user.id)
    }
    
    func logout() {
        SessionManager.shared.clearSession()
        userDefaults.removeObject(forKey: currentUserIDKey)
    }
    
    func save(user: User) {
        do {
            let data = try JSONEncoder().encode(user)
            userDefaults.set(data, forKey: userKey(for: user.id))
        } catch {
            print("Falha ao codificar usuário:", error)
        }
    }
    
    func loadCurrentUser() -> User? {
        let id = SessionManager.shared.currentUserID ?? userDefaults.string(forKey: currentUserIDKey)
        guard let id else { return nil }
        return loadUser(id: id)
    }
    
    func loadUser(id: String) -> User? {
        guard let data = userDefaults.data(forKey: userKey(for: id)) else { return nil }
        do {
            return try JSONDecoder().decode(User.self, from: data)
        } catch {
            print("Falha ao decodificar usuário:", error)
            return nil
        }
    }
    
    func updateCurrentUserName(name: String) {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard var user = loadCurrentUser(), !trimmedName.isEmpty else { return }
        user.name = trimmedName
        save(user: user)
    }
    
    func updateCurrentUserProfileImage(data: Data?) {
        guard var user = loadCurrentUser() else { return }
        user.profileImageData = data
        save(user: user)
    }
}
