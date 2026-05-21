//
//  LoginBottomSheetScreen.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 18/05/26.
//

import UIKit

protocol LoginBottomSheetScreenDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}

class LoginBottomSheetScreen: UIView {
    
    private weak var delegate: LoginBottomSheetScreenDelegate?
    
    func configDelegate(delegate: LoginBottomSheetScreenDelegate) {
        self.delegate = delegate
    }
    
    private lazy var handleAreaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = Metrics.tiny
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Localizable.LoginBottomSheet.title
        label.textColor = Colors.gray100
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = Typography.subHeading
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Localizable.LoginBottomSheet.emailTitle
        label.textColor = Colors.gray100
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = Typography.label
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Localizable.LoginBottomSheet.emailPlaceholder
        textField.textColor = Colors.gray200
        textField.font = Typography.input
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.isSecureTextEntry = false
        // TODO - Target
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Localizable.LoginBottomSheet.passwordTitle
        label.textColor = Colors.gray100
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = Typography.label
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Localizable.LoginBottomSheet.passwordPlaceholder
        textField.textColor = Colors.gray200
        textField.font = Typography.input
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.isSecureTextEntry = true
        // TODO - Target
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Localizable.LoginBottomSheet.loginButtonTitle, for: .normal)
        button.setTitleColor(Colors.gray800, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 1
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tappedLoginButton(_ sender: UIButton) {
        guard let user = emailTextField.text,
              let password = passwordTextField.text else { return }
        delegate?.sendLoginData(user: user, password: password)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        backgroundColor = Colors.gray800
        layer.cornerRadius = Metrics.medium
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.masksToBounds = true
    }
    
    private func addVisualElements() {
        addSubview(handleAreaView)
        addSubview(titleLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            handleAreaView.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.small),
            handleAreaView.centerXAnchor.constraint(equalTo: centerXAnchor),
            handleAreaView.widthAnchor.constraint(equalToConstant: Metrics.huge),
            handleAreaView.heightAnchor.constraint(equalToConstant: Metrics.tiny),
            
            titleLabel.topAnchor.constraint(equalTo: handleAreaView.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.huge),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
}
