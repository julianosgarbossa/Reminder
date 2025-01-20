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
    public weak var loginFlowDelegate: LoginFlowDelegate?
    
    init(loginFlowDelegate: LoginFlowDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.loginFlowDelegate = loginFlowDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.delegate = self
        self.setVisualElements()
        self.bindViewModel()
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
    
    private func bindViewModel() {
        loginViewModel.sucessResult = { [weak self] in
            // chamar a próxima tela de menu com sucesso
            self?.loginFlowDelegate?.navigateToHome()
            print("chegou na viewController")
            // com erro, mostrar o erro para o usuário
        }
    }
}

extension LoginViewController: LoginDelegate {
    func sendLoginData(user: String, password: String) {
        self.loginViewModel.doAuth(userNameLogin: user, password: password)
    }
}
