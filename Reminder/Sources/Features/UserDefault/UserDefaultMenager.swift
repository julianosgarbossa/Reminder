//
//  UserDefaultMenager.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/01/25.
//

import Foundation
import UIKit

class UserDefaultMenager {
    private static let userKey = "app_userKey"
    private static let userNameKey = "app_userName"
    private static let profileImageKey = "app_profileImageKey"
    
    static func saveUser(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func saveUserName(name: String) {
        UserDefaults.standard.set(name, forKey: userNameKey)
        UserDefaults.standard.synchronize()
    }
    
    static func saveProfileImage(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: profileImageKey)
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
    
    static func loadUserName() -> String? {
        return UserDefaults.standard.string(forKey: userNameKey)
    }
    
    static func loadProfileImage() -> UIImage? {
        if let imageData = UserDefaults.standard.data(forKey: profileImageKey) {
            return UIImage(data: imageData)
        }
        return nil
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
        UserDefaults.standard.removeObject(forKey: userNameKey)
        UserDefaults.standard.removeObject(forKey: profileImageKey)
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserName() {
        UserDefaults.standard.removeObject(forKey: userNameKey)
        UserDefaults.standard.synchronize()
    }
}
