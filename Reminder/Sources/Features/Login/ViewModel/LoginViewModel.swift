//
//  LoginViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 16/01/25.
//

import Foundation
import FirebaseAuth

class LoginViewModel {
    var sucessResult: (() -> Void)?
    
    func doAuth(userNameLogin: String, password: String) {
        // vai fazer a requisição ou chamar a camada de serviço
        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] result, error in
            if let error {
                print("autenticação falhou: \(error.localizedDescription)")
            } else {
                self?.sucessResult?()
                print("sucesso na autenticação: \(String(describing: result))")
            }
        }
    }
}
