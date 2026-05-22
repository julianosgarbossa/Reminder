//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/05/26.
//

import Foundation
import FirebaseAuth

protocol LoginBottomSheetViewModelDelegate: AnyObject {
    func successResult(email: String)
    func failure(error: String)
}

class LoginBottomSheetViewModel {
    
    private weak var delegate: LoginBottomSheetViewModelDelegate?
    
    func configDelegate(delegate: LoginBottomSheetViewModelDelegate) {
        self.delegate = delegate
    }
    
    func doAuth(user: String, password: String) {
        Auth.auth().signIn(withEmail: user, password: password) { [weak self] authResult, error in
            guard let self else { return }
            if let error {
                self.delegate?.failure(error: error.localizedDescription)
            } else {
                self.delegate?.successResult(email: user)
            }
        }
    }
}
