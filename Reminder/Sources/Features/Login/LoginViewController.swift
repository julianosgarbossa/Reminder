//
//  LoginViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 09/01/25.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()
    private let loginViewModel = LoginViewModel()
    var handleAreaHeigh: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.delegate = self
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        self.view.addSubview(loginView)
        
        self.setConstraints()
        self.setGesture()
    }
    
    private func setConstraints() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
//        let heighConstraint = 
        loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    private func setGesture() {
        // próxima aula
    }
    
    private func handlePanGesture() {
        // próxima aula
    }
    
    func animatedShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginViewController: LoginDelegate {
    func sendLoginData(user: String, password: String) {
        self.loginViewModel.doAuth(userNameLogin: user, password: password)
    }
}
