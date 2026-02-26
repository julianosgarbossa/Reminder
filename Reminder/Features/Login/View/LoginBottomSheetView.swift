//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 10/02/26.
//

import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}

class LoginBottomSheetView: UIView {
    
    private weak var delegate: LoginBottomSheetViewDelegate?
    
    func delegate(delegate: LoginBottomSheetViewDelegate) {
        self.delegate = delegate
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "login.label.title".localized
        label.font = Typography.subHeading
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "login.label.email".localized
        label.font = Typography.label
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "login.email.placeholder".localized
        textField.font = Typography.input
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "login.label.password".localized
        label.font = Typography.label
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "login.password.placeholder".localized
        textField.font = Typography.input
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("login.button.title".localized, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.tintColor = .white
        button.layer.cornerRadius = Metrics.medium
        button.backgroundColor = Colors.primaryRedBase
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func didTapLoginButton(_sender: UIButton) {
        guard let user = emailTextField.text,
              let password = passwordTextField.text else { return }
        delegate?.sendLoginData(user: user, password: password)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.medium
        self.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.addSubview(titleLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.large),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.large),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.large),
            emailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.large),
            loginButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
}
