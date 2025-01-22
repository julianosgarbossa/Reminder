//
//  LoginViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 09/01/25.
//

import UIKit

class LoginViewController: UIViewController {
    private let loginView: LoginView
    private let loginViewModel = LoginViewModel()
    var handleAreaHeigh: CGFloat = 50.0
    public weak var loginFlowDelegate: LoginFlowDelegate?
    
    init(loginView: LoginView, loginFlowDelegate: LoginFlowDelegate) {
        self.loginView = loginView
        self.loginFlowDelegate = loginFlowDelegate
        super.init(nibName: nil, bundle: nil)
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
        loginViewModel.sucessResult = { [weak self] result in
            // chamar a próxima tela de menu com sucesso
            self?.presentSaveLoginAlert(userNameLogin: result)
        }
        
        loginViewModel.errorResult = { [weak self] error in
            self?.presentErrorAlert(message: error)
        }
    }
    
    private func presentSaveLoginAlert(userNameLogin: String) {
        let alertController = UIAlertController(title: "Salvar Acesso", message: "Deseja salvar o seu acesso?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) { _ in
            let user = User(email: userNameLogin, isUserSaved: true)
            UserDefaultMenager.saveUser(user: user)
            self.loginFlowDelegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            let user = User(email: userNameLogin, isUserSaved: false)
            UserDefaultMenager.saveUser(user: user)
            self.loginFlowDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    private func presentErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}

extension LoginViewController: LoginDelegate {
    func sendLoginData(user: String, password: String) {
        self.loginViewModel.doAuth(userNameLogin: user, password: password)
    }
}
