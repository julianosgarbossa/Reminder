//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 26/02/26.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    
    var sucessResult: (() -> Void)?
    
    func doAuth(user: String, password: String) {
        Auth.auth().signIn(withEmail: user, password: password) { [weak self] authResult, error in
            if let error {
                print("A autenticação falhou: \(error.localizedDescription)")
            } else {
                self?.sucessResult?()
            }
        }
    }
}
