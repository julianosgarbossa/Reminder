//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/05/26.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    func doAuth(user: String, password: String) {
        Auth.auth().signIn(withEmail: user, password: password) { authResult, error in
            if let error {
                print("Autenticação Falhou: \(error)")
            } else {
                guard let authResult else { return }
                print("Usuário Logado com Sucesso: \(authResult)")
            }
        }
    }
}
