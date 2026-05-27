//
//  SessionManager.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 27/05/26.
//

import Foundation

final class SessionManager {
    
    static let shared = SessionManager()
    
    private init() {}
    
    private(set) var currentUserID: String?
    
    func startSession(userID: String) {
        currentUserID = userID
    }
    
    func clearSession() {
        currentUserID = nil
    }
}
