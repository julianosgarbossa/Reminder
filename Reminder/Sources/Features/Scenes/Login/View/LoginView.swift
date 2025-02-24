//
//  LoginView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 09/01/25.
//

import UIKit

class LoginView: UIView {
    
    public weak var delegate: LoginDelegate?
    private var passwordIsHide = true
    
    private let handleArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray200
        view.layer.cornerRadius = Metrics.tiny
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray100
        label.font = Typography.subHeading
        label.textAlignment = .left
        label.text = "login.label.title".localized
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray100
        label.font = Typography.label
        label.textAlignment = .left
        label.text = "login.email.title".localized
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "login.email.placeholder".localized
        textField.font = Typography.input
        textField.borderStyle = .roundedRect
        textField.textColor = Colors.gray200
        textField.backgroundColor = Colors.gray800
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray100
        label.font = Typography.label
        label.textAlignment = .left
        label.text = "login.password.title".localized
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "login.password.placeholder".localized
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.font = Typography.input
        textField.backgroundColor = Colors.gray800
        return textField
    }()
    
    private lazy var passwordEyeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "login.textfield.eye.slash.icon".localized), for: .normal)
        button.tintColor = Colors.blueBase
        button.addTarget(self, action: #selector(passwordEyeButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("login.button.title".localized, for: .normal)
        button.setTitleColor(Colors.gray800, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.redBase
        button.layer.cornerRadius = Metrics.medium
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func exempleTaped() {
        // Apenas para estudo
        print("clicou na label")
    }
    
    @objc
    private func passwordEyeButtonDidTapped() {
        passwordIsHide.toggle()
        if passwordIsHide {
            self.passwordEyeButton.setImage(UIImage(systemName: "login.textfield.eye.slash.icon".localized), for: .normal)
            self.passwordTextField.isSecureTextEntry = true
        } else {
            self.passwordEyeButton.setImage(UIImage(systemName: "login.textfield.eye.icon".localized), for: .normal)
            self.passwordTextField.isSecureTextEntry = false
        }
    }
    
    @objc
    private func loginButtonDidTapped() {
        let user = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        delegate?.sendLoginData(user: user, password: password)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setVisualElements()
        self.backgroundColor = Colors.gray800
        self.layer.cornerRadius = Metrics.medium
        self.setDelegates()
        
        // Nada funcional, apenas para estudo
        let exempleGest = UITapGestureRecognizer(target: self, action: #selector(exempleTaped))
        titleLabel.addGestureRecognizer(exempleGest)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setVisualElements() {
//        self.addSubview(handleArea)
        self.addSubview(titleLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(passwordEyeButton)
        self.addSubview(loginButton)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
//            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
//            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            handleArea.widthAnchor.constraint(equalToConstant: 40),
//            handleArea.heightAnchor.constraint(equalToConstant: 6),

            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.mediumLarge),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.mediumLarge),

            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.hugeSmall),
            emailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.mediumSmall),
            passwordLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordEyeButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            passwordEyeButton.leadingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -Metrics.hugeSmall),
            passwordEyeButton.widthAnchor.constraint(equalToConstant: Metrics.medium),
            passwordEyeButton.heightAnchor.constraint(equalToConstant: Metrics.medium),
            
            loginButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.smallLarge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

#Preview {
    LoginView()
}
