//
//  LoginViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 09/01/25.
//

import UIKit

class LoginViewController: UIViewController {

    private let contentView = LoginView()
    var handleAreaHeigh: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.delegate = self
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        self.view.addSubview(contentView)
        
        self.setConstraints()
        self.setGesture()
    }
    
    private func setConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let heighConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    private func setGesture() {
        // próxima aula
    }
    
    private func handlePanGesture() {
        // próxima aula
    }
    
    func animatedShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginViewController: LoginDelegate {
    func sendLoginData(user: String, password: String) {
        print(user)
        print(password)
    }
}
